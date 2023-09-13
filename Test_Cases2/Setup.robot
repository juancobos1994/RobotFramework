*** Settings ***
Documentation    Setup and Teardown
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

Suite Setup     Inicio           #Todos los test empiezan con esta funcion
Suite Teardown      Salir         #Todos los test terminan con esta funcion

*** Variables ***
${Url}=     https://admin-demo.nopcommerce.com/login
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    Validar_Login

Demo Dos
    Validar_Login2

*** Keywords ***

Inicio
    [Documentation]    Prueba de Setup y Teardown
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Your store. Login     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

Validar_Login
    F_texto     id=Email    juan@hotmail.com
    F_texto     id=Password     12345
    click button    xpath=//button[contains(@type,'submit')]

    wait until page contains    Login was unsuccessful. Please correct the errors and try again.

Validar_Login2
    ${mail}=    set variable
    F_texto     id=Email    ${mail}
    F_texto     id=Password     12345
    click button    xpath=//button[contains(@type,'submit')]

    wait until page contains    Please enter your email


Salir
    Sleep    2
    close browser