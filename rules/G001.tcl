#!/usr/bin/tclsh
# files should always start with the standard header of the school.

foreach f [getSourceFileNames] {
    set rule "G1  > $f"
    set lineNumber 1

    foreach line [getAllLines $f] {

        if [regexp {^Makefile$} $f] {
            if {$lineNumber == 1 && [regexp {^##$} $line]
            ||  $lineNumber == 2 && ![regexp {^## EPITECH PROJECT, \d{4}$} $line]
            ||  $lineNumber == 3 && ![regexp {^## .*$} $line]
            ||  $lineNumber == 4 && ![regexp {^## File description:$} $line]
            ||  $lineNumber == 5 && ![regexp {^## .*$} $line]
            ||  $lineNumber == 6 && ![regexp {^##$} $line]} {
                report $rule $lineNumber "you must start your source code with a correctly formatted Epitech standard header"
            }
        } else {
            if {$lineNumber == 1 && ![regexp {^\/\*$} $line]
            ||  $lineNumber == 2 && ![regexp {^\*\* EPITECH PROJECT, \d{4}$} $line]
            ||  $lineNumber == 3 && ![regexp {^\*\* .*$} $line]
            ||  $lineNumber == 4 && ![regexp {^\*\* File description:$} $line]
            ||  $lineNumber == 5 && ![regexp {^\*\* .*$} $line]
            ||  $lineNumber == 6 && ![regexp {^\*\/$} $line]} {
                report $rule $lineNumber "you must start your source code with a correctly formatted Epitech standard header"
            }
        }

        incr lineNumber
    }
}
