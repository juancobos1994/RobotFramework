*** Settings ***
Documentation    Practica Cuadros de Dialogos
Library  SeleniumLibrary
Library    Dialogs
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://demoqa.com/text-box
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Prueba de dialogo
    [Tags]    TestUno
    ${sel_navegador}=    Get Selection From User    Select a browser    Chrome    Firefox    
    Open Browser    ${Url}  ${sel_navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea
    
    F_texto    //input[@id='userName']    Juan
    F_texto    //input[@id='userEmail']    juan@hotmail.com

    Execute Manual Step    Estas de acuerdo en continuar?

    F_texto    //textarea[@id='currentAddress']    Calle12
    Pause Execution
    F_texto    //textarea[@id='permanentAddress']    Direccion2
    Sleep    2
    close browser


*** Keywords ***

