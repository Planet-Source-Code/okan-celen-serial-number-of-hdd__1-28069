VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   870
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   1560
   LinkTopic       =   "Form1"
   ScaleHeight     =   870
   ScaleWidth      =   1560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Get Serial"
      Height          =   465
      Left            =   270
      TabIndex        =   0
      Top             =   210
      Width           =   915
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetVolumeSerialNumber Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long

Public Function VolumeSerialNumber(ByVal RootPath As String) As String

Dim VolLabel As String
Dim VolSize As Long
Dim Serial As Long
Dim MaxLen As Long
Dim Flags As Long
Dim Name As String
Dim NameSize As Long
Dim s As String
Dim ret As Boolean

ret = GetVolumeSerialNumber(RootPath, VolLabel, VolSize, Serial, MaxLen, Flags, Name, NameSize)

If ret Then

'Create an 8 character string
s = Format(Hex(Serial), "00000000")
'Adds the '-' between the first 4 characters and the last 4 characters
VolumeSerialNumber = Left(s, 4) + "-" + Right(s, 4)

Else

'If the call to API function fails the function returns a zero serial number
VolumeSerialNumber = "0000-0000"

End If

End Function

Private Sub Command1_Click()

MsgBox VolumeSerialNumber("C:\") 'Shows the serial number of your Hard Disk

End Sub

