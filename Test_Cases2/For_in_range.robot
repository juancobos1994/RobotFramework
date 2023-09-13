*** Settings ***
Documentation    Practica For in range
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.Google.com
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Prueba for in range
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Google     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    FOR     ${i}    IN RANGE    0   10
        log to console    ${i}
    END


    Sleep    2
    close browser


*** Keywords ***

