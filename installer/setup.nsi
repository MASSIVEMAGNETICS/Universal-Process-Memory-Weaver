; Complete polished NSIS MUI2 script for Universal Process Memory Weaver

!include "MUI2.nsh"
!include "x64.nsh"
!include "LogicLib.nsh"

Name "Universal Process Memory Weaver v1.0"
OutFile "UniversalMemoryWeaver_Setup.exe"
InstallDir "$PROGRAMFILES64\UniversalMemoryWeaver"
RequestExecutionLevel admin
SetCompressor /SOLID lzma

!define MUI_ICON "..\assets\icon.ico"
!define MUI_UNICON "..\assets\icon.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\welcome.bmp"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "Core Files (Required)" SEC_CORE
    SectionIn RO
    SetOutPath "$INSTDIR"
    File /r "..\*.*"
    CreateShortCut "$DESKTOP\Universal Weaver.lnk" "$INSTDIR\one-click-launcher.exe"
    CreateShortCut "$SMPROGRAMS\Universal Weaver\Universal Weaver.lnk" "$INSTDIR\one-click-launcher.exe"
SectionEnd

Section /o "Kernel Driver (Advanced Users)" SEC_DRIVER
    SetOutPath "$INSTDIR\kernel_driver"
    File "..\kernel_driver\weaver_driver.sys"
    File "..\kernel_driver\weaver_driver.inf"
    DetailPrint "Kernel driver copied. Enable Test Signing if needed."
SectionEnd

Section -Post
    ExecWait '"$INSTDIR\install.bat"'
    ExecShell "" "$INSTDIR\one-click-launcher.exe"
SectionEnd

Section Uninstall
    Delete "$DESKTOP\Universal Weaver.lnk"
    RMDir /r "$INSTDIR"
SectionEnd