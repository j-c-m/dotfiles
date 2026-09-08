import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.workspaces"

  property var windowsByWorkspace: ({})

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5]
    var values = Hyprland.workspaces.values

    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function workspaceNumber(id) {
    return id === 10 ? "0" : String(id)
  }

  function prettyToken(value) {
    var text = String(value || "").replace(/[-_]+/g, " ").trim()
    if (text === "") return ""
    return text.replace(/\b\w/g, function(ch) { return ch.toUpperCase() })
  }

  function appName(client) {
    var wmClass = String((client && (client.class || client.initialClass)) || "").trim()
    if (wmClass === "") return ""

    var pwa = wmClass.match(/^msedge-(.+)__/)
    if (pwa) {
      var host = pwa[1].split(".")[0]
      var pwaEntry = DesktopEntries.heuristicLookup(host)
      if (pwaEntry && pwaEntry.name) return String(pwaEntry.name)
      return prettyToken(host)
    }

    var entry = DesktopEntries.heuristicLookup(wmClass)
    if (entry && entry.name) return String(entry.name)

    var id = wmClass.split(".").pop()
    entry = DesktopEntries.heuristicLookup(id)
    if (entry && entry.name) return String(entry.name)

    return prettyToken(id)
  }

  function windowsForId(id) {
    return root.windowsByWorkspace[id] || []
  }

  function tooltipFor(windows) {
    var lines = []
    for (var i = 0; i < windows.length; i++) {
      var name = windows[i].name
      var title = windows[i].title
      if (name && title && title !== name) lines.push(name + " — " + title)
      else if (name || title) lines.push(name || title)
    }
    return lines.join("\n")
  }

  function refresh() {
    if (clientsProc.running) {
      refreshPending = true
      return
    }
    refreshPending = false
    clientsProc.running = true
  }

  property bool refreshPending: false

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  Component.onCompleted: root.refresh()

  Connections {
    target: Hyprland
    function onRawEvent(event) {
      var name = event && event.name ? String(event.name) : ""
      if (name.indexOf("window") !== -1 || name === "moveworkspace")
        refreshTimer.restart()
    }
  }

  Timer {
    id: refreshTimer
    interval: 80
    onTriggered: root.refresh()
  }

  Process {
    id: clientsProc
    command: ["hyprctl", "-j", "clients"]
    onRunningChanged: {
      if (!running && root.refreshPending) root.refresh()
    }
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var clients
        try {
          clients = JSON.parse(text || "[]")
        } catch (e) {
          return
        }
        if (!Array.isArray(clients)) return

        var map = {}
        for (var i = 0; i < clients.length; i++) {
          var client = clients[i]
          if (client.mapped === false) continue
          var ws = client.workspace ? client.workspace.id : 0
          if (typeof ws !== "number" || ws <= 0) continue
          var name = root.appName(client)
          var title = String(client.title || "").trim()
          if (name === "" && title === "") continue
          if (!map[ws]) map[ws] = []
          map[ws].push({ name: name, title: title })
        }
        root.windowsByWorkspace = map
      }
    }
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      WidgetButton {
        required property int modelData

        readonly property var windows: root.windowsForId(modelData)
        readonly property bool occupied: windows.length > 0
        readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData

        bar: root.bar
        text: focused ? "\uDB85\uDCFB" : root.workspaceNumber(modelData)
        tooltipText: root.tooltipFor(windows)
        opacity: occupied || focused ? 1 : 0.5
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : Style.space(20)
        fixedHeight: root.barSize
        onPressed: function() { root.focusWorkspace(modelData) }
      }
    }
  }
}
