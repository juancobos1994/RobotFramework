*** Settings ***
Documentation    Switch en Navegadores
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://demoqa.com
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Switch de Navegadores
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea



    sleep   3
    go to    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login     #Ingresar a una pagina
    Sleep    2
    go back         #Regresar a la pagina anterior
    close all browsers


*** Keywords ***

