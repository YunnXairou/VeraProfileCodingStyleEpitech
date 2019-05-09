#!/usr/bin/tclsh
# Source file should not be too long

set maxLines [getParameter "max-file-length" 2000]

foreach f [getSourceFileNames] {
    set rule "L6  > $f"

    set length [getLineCount $f]
    if {$length > $maxLines} {
        report $rule $length "source file is too long"
    }
}
