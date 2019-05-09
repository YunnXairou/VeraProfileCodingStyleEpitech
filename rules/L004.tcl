#!/usr/bin/tclsh
# Line cannot be too long

set maxLength [getParameter "max-line-length" 80]

foreach f [getSourceFileNames] {
    set rule "F4  > $f"

    set lineNumber 1
    foreach line [getAllLines $f] {
        if {[string length $line] > $maxLength} {
            report $rule $lineNumber "line is longer than ${maxLength} characters"
        }
        incr lineNumber
    }
}
