#!/usr/bin/tclsh
# Don't use tab characters

foreach f [getSourceFileNames] {
    if ![regexp {^Makefile$} $f] {
        set rule "L2  > $f"
        set lineNumber 1

        foreach line [getAllLines $f] {

            if [regexp {\t} $line] {
                report $rule $lineNumber "horizontal tab used"
            }

            incr lineNumber
        }
    }
}
