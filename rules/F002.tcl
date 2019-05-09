#!/usr/bin/tclsh
# File names should be well-formed

set maxDirectoryDepth [getParameter "max-directory-depth" 8]
set maxDirnameLength [getParameter "max-dirname-length" 31]
set maxFilenameLength [getParameter "max-filename-length" 31]
set maxPathLength [getParameter "max-path-length" 100]

foreach fileName [getSourceFileNames] {
    set rule "F2  > $fileName"

    if {[string length $fileName] > $maxPathLength} {
        report $rule 1 "path name too long"
    }

    set dirDepth 0
    foreach dir [file split [file dirname $fileName]] {
        if {$dir == "/" || $dir == "." || $dir == ".."} {
            continue
        }

        incr dirDepth

        if {[string length $dir] > $maxDirnameLength} {
            report $rule 1 "directory name component too long"
            break
        }

        set first [string index $dir 0]
        if {[string is alpha $first] == 0 && $first != "_"} {
            report $rule 1 "directory name should start with alphabetic character or underscore"
            break
        }

        if {[string first "." $dir] != -1} {
            report $rule 1 "directory name should not contain a dot"
            break
        }
    }

    if {$dirDepth >= $maxDirectoryDepth} {
        report $rule 1 "directory structure too deep"
    }

    set leafName [file tail $fileName]
    if {[string length $leafName] > $maxFilenameLength} {
        report $rule 1 "file name too long"
    }

    set first [string index $leafName 0]
    if {[string is alpha $first] == 0 && $first != "_"} {
        report $rule 1 "file name should start with alphabetic character or underscore"
    }

    if {[llength [split $leafName .]] > 2} {
        report $rule 1 "file name should not contain more than one dot"
    }
}
