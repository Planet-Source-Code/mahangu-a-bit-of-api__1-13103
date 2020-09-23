VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "API STUFF 1.0.0"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   2745
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   2745
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdShut 
      Caption         =   "&Shut Down Windows"
      Height          =   495
      Left            =   1440
      TabIndex        =   6
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton cmdReboot 
      Caption         =   "Show &Reboot Dialog Box"
      Height          =   495
      Left            =   1440
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnable 
      Caption         =   "&Enable CTRL + ALT +DEL"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton cmdDisable 
      Caption         =   "&Disable CTRL + ALT +DEL"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Show &Find Box"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Show &Run Box"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton cmdMessage 
      Caption         =   "&Message Box"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdDisable_Click()
Call DisableCtrlAltDelete(True)

End Sub

Private Sub cmdEnable_Click()
Call DisableCtrlAltDelete(False)
End Sub

Private Sub cmdFind_Click()
Call ShowFindDialog

End Sub

Private Sub cmdMessage_Click()

If MessageBox(frmMain.hwnd, "Is Planet Source Code cool?", _
        "Hey!", MB_YESNO Or MB_ICONQUESTION) = IDYES Then GoTo 10 Else GoTo 20
        
10
        Call MessageBox(frmMain.hwnd, "www.planet-source-code.com/vb", _
            "Of course it is!", MB_OK Or MB_ICONASTERISK)
    
        GoTo 30
20
        Call MessageBox(frmMain.hwnd, "You have bad taste concering code sites!", _
            "Hey Moron!", MB_OK Or MB_ICONEXCLAMATION)
    
        
30
        
        
End Sub

Private Sub cmdReboot_Click()
Call SettingsChanged(frmMain)
End Sub

Private Sub cmdRun_Click()
    Call ShowRunDialog(Me, "Run Dialog", _
        "Type what you wan't to open. You can use the browse option to find the file you want!")



End Sub

Private Sub cmdShut_Click()
Call ExitWindowsEx(EWX_SHUTDOWN, 0)
End Sub
