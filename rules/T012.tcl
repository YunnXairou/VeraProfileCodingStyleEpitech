#!/usr/bin/tclsh
# Negation operator should not be used in its short form

foreach file [getSourceFileNames] {
    set rule "T12 > $file"

    foreach negation [getTokens $file 1 0 -1 -1 {not}] {
        set value [lindex $negation 0]
        if {$value == "!"} {
            set lineNumber [lindex $negation 1]
            report $rule $lineNumber "negation operator used in its short form"
        }
    }
}
