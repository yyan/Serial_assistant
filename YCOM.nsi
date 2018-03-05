; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "YCOM"
!define PRODUCT_VERSION "1.1"
!define PRODUCT_PUBLISHER "OAKCO"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\WPFSerialAssistant.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "WPFSerialAssistant\1.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "R.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\WPFSerialAssistant.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "YcomSetup.exe"
InstallDir "$PROGRAMFILES\YCOM"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\Config"
  SetOverwrite try
  File "WPFSerialAssistant\bin\Debug\Config\default.conf"
  SetOutPath "$INSTDIR"
  File "WPFSerialAssistant\bin\Debug\data.txt"
  File "WPFSerialAssistant\bin\Debug\Newtonsoft.Json.dll"
  File "WPFSerialAssistant\bin\Debug\Newtonsoft.Json.xml"
  File "WPFSerialAssistant\bin\Debug\WPFSerialAssistant.exe"
  CreateDirectory "$SMPROGRAMS\YCOM"
  CreateShortCut "$SMPROGRAMS\YCOM\YCOM.lnk" "$INSTDIR\WPFSerialAssistant.exe"
  CreateShortCut "$DESKTOP\YCOM.lnk" "$INSTDIR\WPFSerialAssistant.exe"
  File "WPFSerialAssistant\bin\Debug\WPFSerialAssistant.exe.config"
  File "WPFSerialAssistant\bin\Debug\WPFSerialAssistant.pdb"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\YCOM\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\WPFSerialAssistant.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\WPFSerialAssistant.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���估���е������" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\WPFSerialAssistant.pdb"
  Delete "$INSTDIR\WPFSerialAssistant.exe.config"
  Delete "$INSTDIR\WPFSerialAssistant.exe"
  Delete "$INSTDIR\Newtonsoft.Json.xml"
  Delete "$INSTDIR\Newtonsoft.Json.dll"
  Delete "$INSTDIR\data.txt"
  Delete "$INSTDIR\Config\default.conf"

  Delete "$SMPROGRAMS\YCOM\Uninstall.lnk"
  Delete "$DESKTOP\YCOM.lnk"
  Delete "$SMPROGRAMS\YCOM\YCOM.lnk"

  RMDir "$SMPROGRAMS\YCOM"
  RMDir "$INSTDIR\Config"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd