*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.techlistic.com/p/selenium-practice-form.html
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Uno
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Test Page For JavaScript Alerts     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    Sleep    2
    close browser


*** Keywords ***

