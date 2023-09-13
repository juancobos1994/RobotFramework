*** Settings ***
Documentation    Scroll
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.google.com.ec/?hl=es
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Prueba de Scroll
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Google     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    F_texto    xpath=//textarea[@id='APjFqb']   Ferrari
    press keys  xpath=//textarea[@id='APjFqb']  ENTER

    F_scroll    0   500

    scroll element into view    xpath=//span[contains(.,'Siguiente')]
    Sleep    2
    close browser


*** Keywords ***

