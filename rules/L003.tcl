#!/usr/bin/tclsh
# No leading and no trailing empty lines

foreach f [getSourceFileNames] {
    set rule "F3  > $f"

    set lineCount [getLineCount $f]
    if {$lineCount > 0} {
        set firstLine [getLine $f 1]
        if {[string trim $firstLine] == ""} {
            report $rule 1 "leading empty line(s)"
        }

        set lastLine [getLine $f $lineCount]
        if {[string trim $lastLine] == ""} {
            report $rule $lineCount "trailing empty line(s)"
        }
    }
}
