#!/usr/bin/tclsh

foreach fileName [getSourceFileNames] {
    set rule "O3  > $fileName"

    if {[regexp {^\w+\s+(\w+)(\s+?)([^)]*)}  [getAllLines $fileName]] > 5} {
        report $rule $lineNumber "Too much function."
    }
}