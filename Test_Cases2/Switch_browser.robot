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
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea




    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  ${Navegador}

    switch browser    1         #Se trabaja con el primer navegador abierto
    ${titulo1}=  get title           #Obtener el titulo de la pagina
    log to console    ${titulo1}

    switch browser    2         #Se trabaja con el segundo navegador abierto
    ${titulo2}=  get title           #Obtener el titulo de la pagina
    log to console    ${titulo2}

    Sleep    2
    close all browsers


*** Keywords ***

