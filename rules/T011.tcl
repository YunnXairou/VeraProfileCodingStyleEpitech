#!/usr/bin/tclsh
# Curly brackets from the same pair should be either in the same line or in the same column

proc acceptPairs {} {
    global file parens index end
    set rule "T11 > $file"

    while {$index != $end} {
        set nextToken [lindex $parens $index]
        set tokenValue [lindex $nextToken 0]

        if {$tokenValue == "\{"} {
            incr index
            set leftParenLine [lindex $nextToken 1]
            set leftParenColumn [lindex $nextToken 2]

            acceptPairs

            if {$index == $end} {
                report $rule $leftParenLine "opening curly bracket is not closed"
                return
            }

            set nextToken [lindex $parens $index]
            incr index
            set tokenValue [lindex $nextToken 0]
            set ruleightParenLine [lindex $nextToken 1]
            set ruleightParenColumn [lindex $nextToken 2]

            if {($leftParenLine != $ruleightParenLine) && ($leftParenColumn != $ruleightParenColumn)} {
                # make an exception for line continuation
                set leftLine [getLine $file $leftParenLine]
                set ruleightLine [getLine $file $ruleightParenLine]
                if {[string index $leftLine end] != "\\" && [string index $ruleightLine end] != "\\"} {
                    report $rule $ruleightParenLine "closing curly bracket not in the same line or column"
                }
            }
        } else {
            return
        }
    }
}

foreach file [getSourceFileNames] {
    set rule "T11 > $file"

    set parens [getTokens $file 1 0 -1 -1 {leftbrace rightbrace}]
    set index 0
    set end [llength $parens]
    acceptPairs
    if {$index != $end} {
        report $rule [lindex [lindex $parens $index] 1] "excessive closing bracket?"
    }
}
