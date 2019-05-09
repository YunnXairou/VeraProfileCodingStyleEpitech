#!/usr/bin/tclsh
# Keywords break and continue should be immediately followed by a semicolon

foreach f [getSourceFileNames] {
    set rule "T5  > $f"

    foreach t [getTokens $f 1 0 -1 -1 {break continue}] {
        set keyword [lindex $t 0]
        set line [lindex $t 1]
        set column [lindex $t 2]
        set semicolons [getTokens $f $line [expr $column + [string length $keyword]] [expr $line + 1] 0 {semicolon}]
        if {$semicolons == {}} {
            report $rule $line "keyword '${keyword}' not immediately followed by a semicolon"
        } else {
            set semColumn [lindex [lindex $semicolons 0] 2]
            if {$semColumn != $column + [string length $keyword]} {
                report $rule $line "keyword '${keyword}' not immediately followed by a semicolon"
            }
        }
    }
}
