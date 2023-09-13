*** Settings ***
Documentation    Pruebas Curso RobotFramework
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
Mi primer test
    [Documentation]    Primera prueba del sistema
    [Tags]    testUno
    Open Browser    https://demoqa.com/text-box   Chrome
    maximize browser window
    Sleep    2
    input text    id=userName   Juan
    input text    id=userEmail  juan@hotmail.com
    input text    id=currentAddress     Direccion1
    input text    id=permanentAddress   Direccion
    Sleep    2
    execute javascript    window.scrollTo(0,300)
    Sleep    2
    click button    id=submit
    close browser

Mi segundo test
    [Documentation]    Segunda prueba del sistema
    [Tags]    testDos
    Open Browser    https://demoqa.com/text-box   Chrome
    maximize browser window
    Sleep    2
    input text    id=userName   Juan
    input text    id=userEmail  juan@hotmail.com
    input text    id=currentAddress     Direccion1
    input text    id=permanentAddress   Direccion
    Sleep    2
    execute javascript    window.scrollTo(0,300)
    Sleep    2
    click button    id=submit
    close browser
*** Keywords ***