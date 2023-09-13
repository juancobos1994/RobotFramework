*** Settings ***
Documentation    Practica For exit
Library  SeleniumLibrary
Library    String
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.Google.com
${Navegador}=   Chrome
@{ROBOTS}=  Bender  Terminator  Robocop
@{nums}=    1   2   3   4   5
*** Test Cases ***
Demo Uno
    [Documentation]    Prueba for continue
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Google     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    FOR     ${i}    IN  @{ROBOTS}
        exit for loop if    $i=='Terminator'
        log to console    ${i}
    END

    FOR     ${j}    IN  @{nums}
        log to console    ${j}
        ${numbers}=     Generate Random String  5   1000
        log to console    ${numbers}
    END

    Sleep    2
    close browser


*** Keywords ***

