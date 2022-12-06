Gui, Add, Text, x2 y9 w110 h20 , Full path to image file:
Gui, Add, Edit, x2 y29 w150 h20 vfilepath,
Gui, Add, Text, x2 y69 w120 h20 , *n value (from 0 to 255):
Gui, Add, Edit, x2 y89 w110 h20 vnumber,
Gui, Add, Text, x2 y129 w130 h20 , Custom screen resolution:
Gui, Add, Text, x2 y149 w10 h20 , X
Gui, Add, Edit, x12 y149 w60 h20 vxval,
Gui, Add, Text, x72 y149 w20 h20 , Y
Gui, Add, Edit, x82 y149 w60 h20 vyval,
Gui, Add, Button, x162 y19 w100 h30 gimagesearch, Check!
Gui, Add, Button, x162 y79 w100 h30 gnvalue, Check with *n
Gui, Add, Button, x162 y139 w100 h30 gresolution, Check!1
Gui, Add, Button, x12 y179 w120 h30 gresn, Resolution + *n

Gui, Show, x583 y290 h229 w280, ImgSearcher
Return

GuiClose:
ExitApp




imagesearch:
{
GuiControlGet, filepath
CoordMode, Pixel, Window
WinMinimize, ahk_exe AutoHotkey.exe
Sleep 500
ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, %filepath%
if (ErrorLevel = 0)
{
MouseMove, OutputVarX, OutputVarY
}
else
{
MsgBox, Image not found!
}
}
return

nvalue:
{
GuiControlGet, filepath
GuiControlGet, number
CoordMode, Pixel, Window
WinMinimize, ahk_exe AutoHotkey.exe
Sleep 500
ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, *%number% %filepath%
if (ErrorLevel = 0)
{
MouseMove, OutputVarX, OutputVarY
}
else
{
MsgBox, Image not found!
}
}
return

resolution:
{
GuiControlGet, filepath
GuiControlGet, xval
GuiControlGet, yval
CoordMode, Pixel, Window
WinMinimize, ahk_exe AutoHotkey.exe
Sleep 500
ImageSearch, OutputVarX, OutputVarY, 0, 0, %xval%, %yval%, %filepath%
if (ErrorLevel = 0)
{
MouseMove, OutputVarX, OutputVarY
}
else
{
MsgBox, Image not found!
}
}
return

resn:
{
GuiControlGet, filepath
GuiControlGet, xval
GuiControlGet, yval
GuiControlGet, number
CoordMode, Pixel, Window
WinMinimize, ahk_exe AutoHotkey.exe
Sleep 500
ImageSearch, OutputVarX, OutputVarY, 0, 0, %xval%, %yval%, *%number% %filepath%
if (ErrorLevel = 0)
{
MouseMove, OutputVarX, OutputVarY
}
else
{
MsgBox, Image not found!
}
}
return