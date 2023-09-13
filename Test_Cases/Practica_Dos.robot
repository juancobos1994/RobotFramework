*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary

*** Variables ***
${Url}=   https://demoqa.com/text-box
${Navegador}=   Chrome
${Nombre}=   Juan
${Email}=   juan@hotmail.com
${DireccionUno}=   Direccion1
${DireccionDos}=   Direccion2


*** Test Cases ***

Demo Uno
    [Documentation]    Utilizando las variables
    [Tags]    VariableUno
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2
    input text    id=userName   ${Nombre}
    input text    id=userEmail  ${Email}
    input text    id=currentAddress     ${DireccionUno}
    input text    id=permanentAddress   ${DireccionDos}
    Sleep    2
    execute javascript    window.scrollTo(0,300)
    Sleep    2
    click button    id=submit
    close browser

Demo Dos
    [Documentation]    Utilizando las variables
    [Tags]    VariableUno
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2
    input text    id=userName   Pedro
    input text    id=userEmail  pedro@gmail.com
    input text    id=currentAddress     ${DireccionUno}
    input text    id=permanentAddress   ${DireccionDos}
    Sleep    2
    execute javascript    window.scrollTo(0,300)
    Sleep    2
    click button    id=submit
    close browser


*** Keywords ***

