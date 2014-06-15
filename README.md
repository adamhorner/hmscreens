# HMScreens

Use hmscreens to either get information about your screens or for setting the
main screen (the screen with the menu bar).

The codebase for this project was initially taken directly from [HAMSoft][HS] by
[Adam Horner][AH] (who is not affiliated with HAMSoft in any way other than by the
modifications to this codebase).

[HS]: http://www.hamsoftengineering.com/codeSharing/hmscreens/hmscreens.html
[AH]: http://www.adamhorner.co.uk/

There is no explicit license on this codebase, Hamsoft just asks for a donation
if you find this code useful, see their page for further details.

## Usage

- `-h` shows the help text
- `-info` shows information about the connected screens
- `-screenIDs` returns only the screen IDs for the connected screens
- `-setMainID <Screen ID>` Screen ID of the screen that you want to make the
  main screen
- `-othersStartingPosition <position> [left|right|top|bottom]` use this with
  -setMainID to determine placement of other screens

**NOTE**: Global Position `{0,0}` coordinate (as shown with `-info`) is the top
left corner of the main screen -- this is different from the main [HAMSoft][HS]
codebase.

### Examples

    hmscreens -info

Returns information about your attached screens including the Screen ID

    hmscreens -setMainID 69670848 -othersStartingPosition left

makes the screen with the Screen ID 69670848 the main screen. Also positions
other screens to the left of the main screen as shown under the "Arrangement"
section of the Displays preference pane.

## Changelog

This only gives details of the early changes (before 2014). See the git commits
for history from 2014 onwards

- Nov 2011 - The screen origin was reset from bottom left to top left to be
  compatible with almost everything else that does screen management on the mac
- Late 2011 - The code was modified to use CoreGraphics to be compatible with
  newer versions of OS X (Mountain Lion and Mavericks)
- Late 2011 - Adam Horner forked the code from the Hamsoft codebase
