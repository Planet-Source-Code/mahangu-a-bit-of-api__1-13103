Attribute VB_Name = "modApi"

'          API MODULE FOR VISUAL BASIC
'          ===========================
' [ Version : 1.0.0 ] [ Build 2000102101 ]
' -----------------------------------------

'                INTRODUCTION
'Module constructed by Mahangu Weerasinghe from code
'which he found on the net This module is FREEWARE..
'use it freely in your appilications.
'With this module you can display the Find Files box,
'display the Run dialog box and display the Reboot
'dialog box. Updates of this module will be posted to
'Planet Source Code.

'                  CONTACT INFO
'Email - mskw@email.com
'Website - http://mahangu.homepage.com
'Free source code available at
' ------> www.planet-source-code.com/vb <-----

'                CREDITS AND MISC INFO
'This module was put together from snippets of code I
'found on the web. Thus I am not sure who coded the
'original code. I am not taking any credit for this
'code... All I did was a make a BAS file out of it!
'_____________________________________________________




'Declaring stuff for the Find Dialog
Declare Function ShellExecute Lib "shell32.dll" Alias _
    "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation _
    As String, ByVal lpFile As String, ByVal lpParameters _
    As String, ByVal lpDirectory As String, ByVal nShowCmd _
    As Long) As Long
   
Const SW_SHOW = 5

'Declaring stuff for the Reboot Dialog
Private Declare Function SHRestartSystemMB Lib _
"shell32" Alias "#59" (ByVal hOwner As Long, ByVal _
sExtraPrompt As String, ByVal uFlags As Long) As Long

Private Const SystemChangeRestart = 4

'Declaring stuff for Disabling the CTRL+ALT+DEL box
Private Declare Function SystemParametersInfo Lib _
"user32" Alias "SystemParametersInfoA" (ByVal uAction _
As Long, ByVal uParam As Long, ByVal lpvParam As Any, _
ByVal fuWinIni As Long) As Long

'Declaring stuff for the Message Box
Public Declare Function MessageBox Lib "user32" Alias "MessageBoxA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long

'Message Box Types
Public Const MB_ABORTRETRYIGNORE = &H2& 'Abort, Retry, Ignore
Public Const MB_YESNO = &H4& ' Yes and No
Public Const MB_YESNOCANCEL = &H3& 'Yes, No, Cancel
Public Const MB_RETRYCANCEL = &H5& 'Retry and Cancel
Public Const MB_OKCANCEL = &H1& 'Ok and Cancel
Public Const MB_OK = &H0& 'Just OK

'Icons
Public Const MB_ICONSTOP = &H10& 'Stop Icon
Public Const MB_ICONQUESTION = &H20& 'Question Mark Icon
Public Const MB_ICONASTERISK = &H40& 'Asterisk Icon
Public Const MB_ICONEXCLAMATION = &H30& 'Exclamation Icon

'Button Types
Public Const IDYES = 6 'Yes Button
Public Const IDNO = 7 'No Button
Public Const IDABORT = 3 'Abort Button
Public Const IDCANCEL = 2 'Cancel Button
Public Const IDIGNORE = 5 'Ignore Button
Public Const IDRETRY = 4 'Retry Button
Public Const IDOK = 1 'Ok Button

'Declaring stuff for the Run Dialog Box
Private Declare Function SHRunDialog Lib "shell32" _
    Alias "#61" (ByVal hOwner As Long, ByVal UnknownP1 _
    As Long, ByVal UnknownP2 As Long, ByVal szTitle _
    As String, ByVal szPrompt As String, ByVal uFlags _
    As Long) As Long
    
'Declaring stuff for Shutdown Windows
Public Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public Const EWX_FORCE = 4
Public Const EWX_LOGOFF = 0
Public Const EWX_REBOOT = 2
Public Const EWX_SHUTDOWN = 1

'Declaring stuff for FormMove
Declare Sub ReleaseCapture Lib "user32" ()
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long



    



  

'Code for the Find Dialog box
Public Sub ShowFindDialog(Optional InitialDirectory As String)

ShellExecute 0, "find", _
  IIf(InitialDirectory = "", "", InitialDirectory), _
  vbNullString, vbNullString, SW_SHOW

End Sub

'Code for the Reboot Dialog box
Public Sub SettingsChanged(FormName As Form)
    SHRestartSystemMB FormName.hwnd, vbNullString, SystemChangeRestart
End Sub


'Code for Disabling the CTRL+ALT+DEL dialog box
Sub DisableCtrlAltDelete(bDisabled As Boolean)
    Dim X As Long
    X = SystemParametersInfo(97, bDisabled, CStr(1), 0)
End Sub

'Code for the Run Dialog Box
Public Sub ShowRunDialog(ByRef CallingForm As Form, _
    Optional Title As String, _
    Optional Description As String)
    
    If Title = "" Then Title = "Run"
    
    If Description = "" Then Description = _
    "Type the name of a program to open, " & _
        "then click OK when finished."
    
    SHRunDialog CallingForm.hwnd, 0, 0, _
        Title, Description, 0
        
End Sub

Sub ShutDown()
Call ExitWindowsEx(EWX_SHUTDOWN, 0)
End Sub

Sub FormMove(TheForm As Form)


    ReleaseCapture
    Call SendMessage(TheForm.hwnd, &HA1, 2, 0&)
End Sub

'_____________________________________________________
'End of File

