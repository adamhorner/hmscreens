-- vim: ft=applescript

set myScreens to getListOfScreens()
repeat with myScreen in myScreens
    log (item 1 of globalPosition of myScreen) & "x" & (item 2 of globalPosition of myScreen)
    log (item 1 of displaySize of myScreen) & "x" & (item 2 of displaySize of myScreen)
end repeat

on makeScreenObject()
    script screenObject
        property screenID : -1
        property displaySize : {0, 0}
        property globalPosition : {-1, -1}
        property colorSpace : ""
        property bpp : 0
        property resolution : {0, 0}
        property refreshRate : 0
        property quartzExtreme : no
    end script
    return screenObject
end makeScreenObject

on getListOfScreens()
    -- run our unix command
    set screencmd to (path to home folder as text) & ".bin:hmscreens"
    set screenLayout to paragraphs of (do shell script quoted form of POSIX path of screencmd & " -info")
    -- prepare data structures
    set screenItem to makeScreenObject()
    set listOfScreens to {}
    -- save the ATID
    set atid to AppleScript's text item delimiters

    repeat with lineItem in screenLayout
        if (length of lineItem = 0) then
            -- END of a screen, add it to the list
            set end of listOfScreens to screenItem
            -- then create a new one
            set screenItem to makeScreenObject()
        else
            set AppleScript's text item delimiters to ": "
            set {varname, varvalue} to text items of lineItem
            set AppleScript's text item delimiters to ", "
            if varname = "Screen ID" then
                set screenID of screenItem to varvalue
            else if varname = "Display Size" then
                set displaySize of screenItem to text items of varvalue
            else if varname = "Global Position" then
                set globalPosition of screenItem to text items of varvalue
            else if varname = "Color Space" then
                set colorSpace of screenItem to varvalue
            else if varname = "Bits Per Pixel" then
                set bpp of screenItem to varvalue
            else if varname = "Resolution(dpi)" then
                set resolution of screenItem to text items of varvalue
            else if varname = "Refresh Rate" then
                set refreshRate of screenItem to varvalue
            else if varname = "Uses Quartz Extreme" then
                set quartzExtreme of screenItem to varvalue
            end if
        end if
    end repeat
    set AppleScript's text item delimiters to atid
    return listOfScreens
end getListOfScreens
