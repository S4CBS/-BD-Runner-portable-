Var InstallerCustomJavaPluginDisabled

!macro CustomCodePreInstall
	${If} ${FileExists} "$INSTDIR\bin\plugin2-disabled\*.*"
		StrCpy $InstallerCustomJavaPluginDisabled true
	${EndIf}
!macroend

!macro CustomCodePostInstall
	Rename "$INSTDIR\jre1.8.0_401\bin" "$INSTDIR\bin"
	Rename "$INSTDIR\jre1.8.0_401\legal" "$INSTDIR\legal"
	Rename "$INSTDIR\jre1.8.0_401\lib" "$INSTDIR\lib"
	Rename "$INSTDIR\jre1.8.0_401\COPYRIGHT" "$INSTDIR\COPYRIGHT"
	Rename "$INSTDIR\jre1.8.0_401\LICENSE" "$INSTDIR\LICENSE"
	Rename "$INSTDIR\jre1.8.0_401\README.txt" "$INSTDIR\README.txt"
	Rename "$INSTDIR\jre1.8.0_401\release" "$INSTDIR\release"
	Rename "$INSTDIR\jre1.8.0_401\THIRDPARTYLICENSEREADME.txt" "$INSTDIR\THIRDPARTYLICENSEREADME.txt"
	Rename "$INSTDIR\jre1.8.0_401\THIRDPARTYLICENSEREADME-JAVAFX.txt" "$INSTDIR\THIRDPARTYLICENSEREADME-JAVAFX.txt"
	Rename "$INSTDIR\jre1.8.0_401\Welcome.html" "$INSTDIR\Welcome.html"
	RMDir "$INSTDIR\jre1.8.0_401"
	nsExec::ExecToLog `"$INSTDIR\Other\Source\UnpackPostInstall.bat"`
	${If} $InstallerCustomJavaPluginDisabled == true
		Rename "$INSTDIR\bin\plugin2" "$INSTDIR\bin\plugin2-disabled"
	${EndIf}
!macroend
