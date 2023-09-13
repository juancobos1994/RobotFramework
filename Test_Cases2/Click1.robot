*** Settings ***
Documentation    Opciones de click
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://demoqa.com/buttons
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Click
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be     DEMOQA         #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    double click element    doubleClickBtn          #Doble click en un elemento

    open context menu       rightClickBtn       #Click derecho en un elemento

    Sleep    2
    close browser


*** Keywords ***

