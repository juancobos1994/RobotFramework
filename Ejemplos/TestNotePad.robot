*** Settings ***
Library  SeleniumLibrary
Library  C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/Files/PywinautoLibrary.py

*** Test Cases ***
Test Notepad
    Log    Testing open notepad
    Start Application    notepad.exe
    sleep    1s
    Get Dialog    Untitled - NotepadNotepad
    Type Keys    Edit    Test
    Menu Select    File -> Save As...
    Get Dialog    Save As
    Type Keys    edit1    test.txt
    Click    Save
    Close Application