#!/usr/bin/tclsh
# No trailing whitespace

set strictMode [getParameter "strict-trailing-space" 0]

foreach f [getSourceFileNames] {
    set rule "L1  > $f"

    set lineNumber 1
    set previousIndent ""
    foreach line [getAllLines $f] {

        if [regexp {^.*\r$} $line] {
          report $rule $lineNumber "CRLF line ending"
          set line [string range $line 0 end-1]
        }
        if [regexp {^.*[[:space:]]+$} $line] {
            if {$strictMode || [string trim $line] != "" || $line != $previousIndent} {
                report $rule $lineNumber "trailing whitespace"
            }
        }

        regexp {^([[:space:]]*).*$} $line dummy previousIndent
        incr lineNumber
    }
}
