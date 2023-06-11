#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

!Space::
eventGhostURL := "http://localhost:8080"
eventName := "play-pause"
outputFile := "C:\temp.html"
UrlDownloadToFile, % eventGhostURL "/?vlc=" eventName, %outputFile%
FileDelete, %outputFile%
return

!Q::
eventGhostURL := "http://localhost:8080"
eventName := "quit"
outputFile := "C:\temp.html"
UrlDownloadToFile, % eventGhostURL "/?vlc=" eventName, %outputFile%
FileDelete, %outputFile%
return

!P::
eventGhostURL := "http://localhost:8080"
eventName := "prev"
outputFile := "C:\temp.html"
UrlDownloadToFile, % eventGhostURL "/?vlc=" eventName, %outputFile%
FileDelete, %outputFile%
return

!N::
eventGhostURL := "http://localhost:8080"
eventName := "next"
outputFile := "C:\temp.html"
UrlDownloadToFile, % eventGhostURL "/?vlc=" eventName, %outputFile%
FileDelete, %outputFile%
return
