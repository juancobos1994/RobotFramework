*** Settings ***
Documentation    Practica ScreenShot
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.google.com/?hl=es
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Demo ScreenShot
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Google     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    #F_Texto     xpath=//textarea[@name='q']     Clima en Cuenca Ecuador
    ${t1}=  F_Texto     xpath=//textarea[@name='q']     Clima en Cuenca Ecuador
    Log To Console    ${t1}

    #F_enter     xpath=//textarea[@name='q']
    ${f2}=  F_enter     xpath=//textarea[@name='q']
    Log To Console    ${f2}
    #Press Keys  xpath=//textarea[@name='q']     ENTER        #Dar enter
    #Captura de pantalla
    #F_foto_pagina    captura1.png
    ${f3}=  F_foto_pagina    captura1.png
    #capture page screenshot     C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/reporte2/IMG/clima1.png
    #Capturar un determinado elemento de la pantalla
    #F_foto_elemento     captura2.png        xpath=//*[@id="wob_wc"]
    ${f4}=  F_foto_elemento     captura2.png        xpath=//*[@id="wob_wc"]
    Log To Console    ${f4}
    #capture element screenshot    xpath=//*[@id="wob_wc"]   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/reporte2/IMG/clima2.png
    Sleep    2
    close browser


*** Keywords ***

