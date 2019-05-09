#!/usr/bin/tclsh
# Don't use tab characters

foreach f [getSourceFileNames] {
    if ![regexp {^Makefile$} $f] {
        set lineNumber 1

        foreach line [getAllLines $f] {

            if [regexp {\t} $line] {
                set r "L2 > $f"
                report $r $lineNumber "horizontal tab used"
            }

            incr lineNumber
        }
    }
}
