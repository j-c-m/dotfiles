#compdef go
# ------------------------------------------------------------------------------
# Copyright (c) 2016 Github zsh-users - http://github.com/zsh-users
# Copyright (c) 2013-2015 Robby Russell and contributors (see
# https://github.com/robbyrussell/oh-my-zsh/contributors)
# Copyright (c) 2010-2014 Go authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the zsh-users nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL ZSH-USERS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# ------------------------------------------------------------------------------
# Description
# -----------
#
#  Completion script for go 1.5 (http://golang.org).
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
#  * Mikkel Oscar Lyderik <mikkeloscar@gmail.com>
#  * oh-my-zsh authors:
#        https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/golang/golang.plugin.zsh
#  * Go authors
#
# ------------------------------------------------------------------------------

typeset -A opt_args

_go() {
  local -a commands build_flags
  commands=(
  'build:compile packages and dependencies'
  'clean:remove object files'
  'doc:show documentation for package or symbol'
  'env:print Go environment information'
  'fix:run go tool fix on packages'
  'fmt:run gofmt on package sources'
  'generate:generate Go files by processing source'
  'get:download and install packages and dependencies'
  'install:compile and install packages and dependencies'
  'list:list packages'
  'run:compile and run Go program'
  'test:test packages'
  'tool:run specified go tool'
  'version:print Go version'
  'vet:run go tool vet on packages'
  'help:get more information about a command'
  )

  _arguments \
    "1: :{_describe 'command' commands}" \
    '*:: :->args'

  case $state in
    args)
      build_flags=(
      '-a[force rebuilding of packages that are already up-to-date]'
      '-n[print the commands but do not run them]'
      '-p[number of builds that can be run in parallel]:number'
      '-race[enable data race detection]'
      '-v[print the names of packages as they are compiled]'
      '-work[print temporary work directory and keep it]'
      '-x[print the commands]'
      '-asmflags[arguments for each go tool asm invocation]:flags'
      '-buildmode[build mode to use]:mode'
      '-compiler[name of compiler to use]:name'
      '-gccgoflags[arguments for gccgo]:args'
      '-gcflags[arguments for each go tool compile invocation]:args'
      '-installsuffix[suffix to add to package directory]:suffix'
      '-ldflags[arguments to pass on each go tool link invocation.]:flags'
      '-linkshared[link against shared libraries]'
      '-pkgdir[install and load all packages from dir]:dir'
      '-tags[list of build tags to consider satisfied]:tags'
      '-toolexec[program to use to invoke toolchain programs]:args'
      )

      __go_packages() {
        local gopaths
        declare -a gopaths
        gopaths=("${(s/:/)$(go env GOPATH)}")
        gopaths+=("$(go env GOROOT)")
        for p in $gopaths; do
          _path_files -W "$p/src" -/
        done
      }

      case $words[1] in
        build)
          _arguments \
            '-o[force build to write to named output file]:file:_files' \
            '-i[installs the packages that are dependencies of the target]' \
            ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;

        clean)
          _arguments \
            '-i[remove corresponding installed archive or binary]' \
            '-r[apply clean recursively on all dependencies]' \
            ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;

        doc)
          _arguments \
            '-c[respect case when matching symbols]' \
            '-cmd[treat a command (package main) like a regular package]' \
            '-u[show docs for unexported and exported symbols and methods]'
            ;;

        fix)
          _arguments '*:importpaths:__go_packages'
          ;;

        fmt)
          _arguments \
            '-n[prints commands that would be executed]' \
            '-x[prints commands as they are executed]' \
            '*:importpaths:__go_packages'
            ;;

        generate)
          _arguments \
            '-run=[specifies a regular expression to select directives]:regex' \
            '-x[print the commands]' \
            '-n[print the commands but do not run them]' \
            '-v[print the names of packages as they are compiled]' \
            "*:args:{ _alternative ':importpaths:__go_packages' _files }"
            ;;

        get)
          _arguments \
            '-d[instructs get to stop after downloading the packages]' \
            '-f[force get -u not to verify that each package has been checked from vcs]' \
            '-fix[run the fix tool on the downloaded packages]' \
            '-insecure[permit fetching/resolving custom domains]' \
            '-t[also download the packages required to build tests]' \
            '-u[use the network to update the named packages]' \
            ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;

        install)
          _arguments ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;

        list)
          _arguments \
            '-e[changes the handling of erroneous packages]' \
            '-f[specifies an alternate format for the list]:format' \
            '-json[causes package data to be printed in JSON format]' \
            ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;

        run)
          _arguments \
            ${build_flags[@]} \
            '-exec[invoke the binary using xprog]:xporg' \
            '*:file:_path_files -g "*.go"'
            ;;

        test)
          _arguments \
            "-c[compile but don't run test]" \
            '-i[install dependencies of the test]' \
            '-bench[run benchmarks matching the regular expression]:regexp' \
            '-benchmem[print memory allocation statistics for benchmarks]' \
            '-benchtime[run benchmarks for t rime]:t' \
            '-blockprofile[write a goroutine blocking profile to the specified file]:block' \
            '-blockprofilerate[control goroutine blocking profiles]:n' \
            '-count[run each test and benchmark n times]:n' \
            '-cover[enable coverage analysis]' \
            '-covermode[set the mode for coverage analysis]:mode:(set count atomic)' \
            '-coverpkg[apply coverage analysis in each test of listed packages]:list' \
            '-coverprofile[write a coverage profile to file]:cover' \
            '-cpu[specify a list of GOMAXPROCS values]:cpus' \
            '-cpuprofile[write a CPU profile to the specified file]:profile' \
            '-memprofile[write a memory profile to file]:mem' \
            '-memprofilerate[enable more precise memory profiles]:n' \
            '-outputdir[place output files from profiling in output dir]:dir' \
            '-parallel[allow parallel execution of test functions]:n' \
            '-run[run tests and examples matching the regular expression]:regexp' \
            '-short[tell long-running tests to shorten their run time]' \
            '-timeout[timeout long running tests]:t' \
            '-trace[write an execution trace to the specified file]:trace' \
            '-v[verbose output]' \
            ${build_flags[@]} \
            '-exec[run test binary using xprog]:xprog' \
            '-o[compile test binary to named file]:file:_files' \
            '*:importpaths:__go_packages'
            ;;

        tool)
          local -a tools
          tools=($(go tool))

          _arguments \
            '-n[print command that would be executed]' \
            "1: :{_describe 'tool' tools}" \
            '*:: :->args'

          case $state in
            args)
              case $words[1] in
                addr2line)
                  _files
                  ;;

                asm)
                  _arguments \
                    '-D[predefined symbol with optional simple value]:value' \
                    '-I[include directory]:value' \
                    '-S[print assembly and machine code]' \
                    '-debug[dump instructions as they are parsed]' \
                    '-dynlink[support references to Go symbols]' \
                    '-o[output file]:string' \
                    '-shared[generate code that can be linked into a shared lib]' \
                    '-trimpath[remove prefix from recorded source file paths]:string'
                  ;;

                callgraph)
                  local -a algos graphs
                  algos=(
                  'static:static calls only'
                  'cha:Class Hierarchy Analysis'
                  'rta:Rapid Type Analysis'
                  'pta:inclusion-based Points-To Analysis'
                  )
                  graphs=(
                  'digraph:output in digraph format'
                  'graphviz:output in AT&T GraphViz (.dot) format'
                  )

                  _arguments \
                    '-algo=[call-graph construction algorithm]:algos:{ _describe "algos" algos }' \
                    "-test[include the package's tests in the analysis]" \
                    '-format=[format in which each call graph edge is displayed]:graphs:{ _describe "graphs" graphs }'
                  ;;

                cgo)
                  _arguments \
                    '-debug-define[print relevant #defines]' \
                    '-debug-gcc[print gcc invocations]' \
                    '-dynimport[if non-empty, print dynamic import data]:string' \
                    '-dynlinker[record dynamic linker information]' \
                    '-dynout[write -dynimport output to file]:file' \
                    '-dynpackage[set Go package for -dynimport output]:string' \
                    '-exportheader[where to write export header]:string' \
                    '-gccgo[generate files for use with gccgo]' \
                    '-gccgopkgpath[-fgo-pkgpath option used with gccgo]:string' \
                    '-gccgoprefix[-fgo-prefix option used with gccgo]:string' \
                    '-godefs[write Go definitions for C file to stdout]' \
                    '-import_runtime_cgo[import runtime/cgo in generated code]' \
                    '-import_syscall[import syscall in generated code]' \
                    '-importpath[import path of package being built]:path' \
                    '-objdir[object directory]:dir'
                  ;;

                compile)
                  _arguments \
                    '-%[debug non-static initializers]' \
                    '-+[compiling runtime]' \
                    "-A[for bootstrapping, allow 'any' type]" \
                    '-B[disable bounds checking]' \
                    '-D[set relative path for local imports]:path' \
                    '-E[debug symbol export]' \
                    '-I[add directory to import search path]:directory' \
                    '-K[debug missing line numbers]' \
                    '-L[use full (long) path in error messages]' \
                    '-M[debug move generation]' \
                    '-N[disable optimizations]' \
                    '-P[debug peephole optimizer]' \
                    '-R[debug register optimizer]' \
                    '-S[print assembly listing]' \
                    '-V[print compiler version]' \
                    '-W[debug parse tree after type checking]' \
                    '-asmhdr[write assembly header to file]:file' \
                    '-buildid[record id as the build id in the export metadata]:id' \
                    '-complete[compiling complete package (no C or assembly)]' \
                    '-cpuprofile[write cpu profile to file]:file' \
                    '-d[print debug information about items in list]:list' \
                    '-dynlink[support references to Go symbols]' \
                    '-e[no limit on number of errors reported]' \
                    '-f[debug stack frames]' \
                    '-g[debug code generation]' \
                    '-h[halt on error]' \
                    '-i[debug line number stack]' \
                    '-importmap[add definition of the form source=actual to import map]:definition' \
                    '-installsuffix[set pkg directory suffix]:suffix' \
                    '-j[debug runtime-initialized variables]' \
                    '-l[disable inlining]' \
                    '-largemodel[generate code that assumes a large memory model]' \
                    '-live[debug liveness analysis]' \
                    '-m[print optimization decisions]' \
                    '-memprofile[write memory profile to file]:file' \
                    '-memprofilerate[set runtime.MemProfileRate to rate]:rate' \
                    '-nolocalimports[reject local (relative) imports]' \
                    '-o[write output to file]:file' \
                    '-p[set expected package import path]:path' \
                    '-pack[write package file instead of object file]' \
                    '-r[debug generated wrappers]' \
                    '-race[enable race detector]' \
                    '-s[warn about composite literals that can be simplified]' \
                    '-shared[generate code that can be linked into a shared library]' \
                    '-trimpath[remove prefix from recorded source file paths]:prefix' \
                    '-u[reject unsafe code]' \
                    '-v[increase debug verbosity]' \
                    '-w[debug type checking]' \
                    '-wb[enable write barrier (default 1)]' \
                    '-x[debug lexer]' \
                    '-y[debug declarations in canned imports (with -d)]' \
                    '*:file:_path_files -g "*.go"'
                  ;;

                cover)
                  if (( CURRENT == 2 )); then
                    _arguments \
                      '-func=[output coverage profile information for each function]:string' \
                      '-html=[generate HTML representation of coverage profile]:file:_files' \
                      '-mode=[coverage mode]:mode:(set count atomic)'
                    return
                  fi

                  _arguments \
                    '-o[file for output]:file' \
                    '-var=[name of coverage variable to generate]:var' \
                    '*:file:_path_files -g "*.go"'
                  ;;

                doc)
                  _arguments \
                    '-c[respect case when matching symbols]' \
                    '-cmd[treat a command (package main) like a regular package]' \
                    '-u[show docs for unexported and exported symbols and methods]' \
                    ;;

                fix)
                  _arguments \
                    '-diff[display diffs instead of rewriting files]' \
                    '-force[force fixes to run even if the code looks updated]:string' \
                    '-r[restrict the rewrites]:string' \
                    '*:files:_files'
                  ;;

                link)
                  _arguments \
                    '-B[add an ELF NT_GNU_BUILD_ID note when using ELF]:note' \
                    '-C[check Go calls to C code]' \
                    '-D[set data segment address (default -1)]:address' \
                    '-E[set entry symbol name]:entry' \
                    '-H[set header type]:type' \
                    '-I[use linker as ELF dynamic linker]:linker' \
                    '-L[add specified directory to library path]:directory' \
                    '-R[set address rounding quantum (default -1)]:quantum' \
                    '-T[set text segment address (default -1)]:address' \
                    '-V[print version and exit]' \
                    '-W[disassemble input]' \
                    '-X[add string value definition]:definition' \
                    '-a[disassemble output]' \
                    '-buildid[record id as Go toolchain build id]:id' \
                    '-buildmode[set build mode]:mode' \
                    '-c[dump call graph]' \
                    '-cpuprofile[write cpu profile to file]:file' \
                    '-d[disable dynamic executable]' \
                    '-extld[use linker when linking in external mode]:linker' \
                    '-extldflags[pass flags to external linker]:flags' \
                    '-f[ignore version mismatch]' \
                    '-g[disable go package data checks]' \
                    '-h[halt on error]' \
                    '-installsuffix[set package directory suffix]:suffix' \
                    '-k[set field tracking symbol]:symbol' \
                    '-linkmode[set link mode]:mode:(internal external auto)' \
                    '-linkshared[link against installed Go shared libraries]' \
                    '-memprofile[write memory profile to file]:file' \
                    '-memprofilerate[set runtime.MemProfileRate to rate]:rate' \
                    '-n[dump symbol table]' \
                    '-o[write output to file]:file' \
                    '-r[set the ELF dynamic linker search path to dir1:dir2:...]:path' \
                    '-race[enable race detector]' \
                    '-s[disable symbol table]' \
                    '-shared[generate shared object (implies -linkmode external)]' \
                    '-tmpdir[use directory for temporary files]:directory' \
                    '-u[reject unsafe packages]' \
                    '-v[print link trace]' \
                    '-w[disable DWARF generation]' \
                    '*:files:_files'
                  ;;

                objdump)
                  _arguments \
                    '-s[only dump symbols matching this regexp]:regexp' \
                    '*:files:_files'
                  ;;

                pack)
                  _arguments '1:ops:(c p r t x)' '::verbose:(v)' ':files:_files'
                  ;;

                pprof)
                  _arguments \
                    '-callgrind[outputs a graph in callgrind format]' \
                    '-disasm=[output annotated assembly]:p' \
                    '-dot[outputs a graph in DOT format]' \
                    '-eog[visualize graph through eog]' \
                    '-evince[visualize graph through evince]' \
                    '-gif[outputs a graph image in GIF format]' \
                    '-gv[visualize graph through gv]' \
                    '-list=[output annotated source for functions matching regexp]:p' \
                    '-pdf[outputs a graph in PDF format]' \
                    '-peek=[output callers/callees of functions matching regexp]:p' \
                    '-png[outputs a graph image in PNG format]' \
                    '-proto[outputs the profile in compressed protobuf format]' \
                    '-ps[outputs a graph in PS format]' \
                    '-raw[outputs a text representation of the raw profile]' \
                    '-svg[outputs a graph in SVG format]' \
                    '-tags[outputs all tags in the profile]' \
                    '-text[outputs top entries in text form]' \
                    '-top[outputs top entries in text form]' \
                    '-tree[outputs a text rendering of call graph]' \
                    '-web[visualize graph through web browser]' \
                    '-weblist=[output annotated source in HTML]:p' \
                    '-output=[generate output on file f (stdout by default)]:f' \
                    '-functions[report at function level (default)]' \
                    '-files[report at source file level]' \
                    '-lines[report at source line level]' \
                    '-addresses[report at address level]' \
                    '-base[show delta from this profile]:profile' \
                    '-drop_negative[ignore negative differences]' \
                    '-cum[sort by cumulative data]' \
                    '-seconds=[length of time for dynamic profiles]:n' \
                    '-nodecount=[max number of nodes to show]:n' \
                    '-nodefraction=[hide nodes below <f>*total]:f' \
                    '-edgefraction=[hide edges below <f>*total]:f' \
                    '-sample_index[index of sample value to display]' \
                    '-mean[average sample value over first value]' \
                    '-inuse_space[display in-use memory size]' \
                    '-inuse_objects[display in-use object counts]' \
                    '-alloc_space[display allocated memory size]' \
                    '-alloc_objects[display allocated object counts]' \
                    '-total_delay[display total delay at each region]' \
                    '-contentions[display number of delays at each region]' \
                    '-mean_delay[display mean delay at each region]' \
                    '-runtime[show runtime call frames in memory profiles]' \
                    '-focus=[restricts to paths going through a node matching regexp]:r' \
                    '-ignore=[skips paths going through any nodes matching regexp]:r' \
                    '-tagfocus=[restrict to samples tagged with key:value matching regexp]:r' \
                    '-tagignore=[discard samples tagged with key:value matching regexp]' \
                    '-call_tree[generate a context-sensitive call tree]' \
                    '-unit=[convert all samples to unit u for display]:u' \
                    '-divide_by=[scale all samples by dividing them by f]:f' \
                    '-buildid=[override build id for main binary in profile]:id' \
                    '-tools=[search path for object-level tools]:path' \
                    '-help[help message]' \
                    '*:files:_files'
                  ;;

                trace)
                  _arguments \
                    '-http=[HTTP service address]:addr' \
                    '*:files:_files'
                  ;;

                vet)
                  _arguments \
                    '-all[check everything]' \
                    '-asmdecl[check assembly against Go declarations]' \
                    '-assign[check for useless assignments]' \
                    '-atomic[check for common mistaken usages of the sync/atomic]' \
                    '-bool[check for mistakes involving boolean operators]' \
                    '-buildtags[check that +build tags are valid]' \
                    '-composites[check that composite literals used field-keyed elements]' \
                    '-compositewhitelist[use composite white list]' \
                    '-copylocks[check that locks are not passed by value]' \
                    '-methods[check that canonically named methods are canonically defined]' \
                    '-nilfunc[check for comparisons between functions and nil]' \
                    '-printf[check printf-like invocations]' \
                    '-printfuncs[print function names to check]:string' \
                    '-rangeloops[check that range loop variables are used correctly]' \
                    '-shadow[check for shadowed variables]' \
                    '-shadowstrict[whether to be strict about shadowing]' \
                    '-shift[check for useless shifts]' \
                    '-structtags[check that struct field tags have canonical format]' \
                    '-tags[list of build tags to apply when parsing]:list' \
                    '-test[for testing only: sets -all and -shadow]' \
                    '-unreachable[check for unreachable code]' \
                    '-unsafeptr[check for misuse of unsafe.Pointer]' \
                    '-unusedfuncs[list of functions whose results must be used]:string' \
                    '-unusedresult[check for unused result of calls to functions in -unusedfuncs]' \
                    '-unusedstringmethods[list of methods whose results must be used]:string' \
                    '-v[verbose]' \
                    '*:files:_files'
                  ;;

                yacc)
                  _arguments \
                    '-o[output]:output' \
                    '-v[parsetable]:parsetable' \
                    '*:files:_files'
                  ;;
              esac
              ;;
          esac
          ;;

        vet)
          _arguments \
            '-n[print commands that would be executed]' \
            '-x[prints commands as they are executed]' \
            ${build_flags[@]} \
            '*:importpaths:__go_packages'
            ;;
        help)
          local -a topics
          topics=(
          'c:calling between Go and C'
          'buildmode:description of build modes'
          'filetype:file types'
          'gopath:GOPATH environment variable'
          'environment:environment variables'
          'importpath:import path syntax'
          'packages:description of package lists'
          'testflag:description of testing flags'
          'testfunc:description of testing functions'
          )

          _arguments "1: :{_describe 'command' commands -- topics}"
          ;;
      esac
      ;;
  esac
}

compdef _go go
