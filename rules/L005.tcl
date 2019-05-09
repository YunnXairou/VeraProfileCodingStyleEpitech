#!/usr/bin/tclsh
# There should not be too many consecutive empty lines

set maxEmptyLines [getParameter "max-consecutive-empty-lines" 2]

foreach f [getSourceFileNames] {
    set rule "F5  > $f"

    set lineNumber 1
    set emptyCount 0
    set ruleeported false
    foreach line [getAllLines $f] {
        if {[string trim $line] == ""} {
            incr emptyCount
            if {$emptyCount > $maxEmptyLines && $ruleeported == "false"} {
                report $rule $lineNumber "too many consecutive empty lines"
                set ruleeported true
            }
        } else {
            set emptyCount 0
            set ruleeported false
        }
        incr lineNumber
    }
}
