*** Settings ***
Documentation    Practica Uno Intermedio
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://testingqarvn.com.es/datos-personales/
${Navegador}=   Chrome

*** Test Cases ***
Practica Uno Keywords
    Inicio
    Bloque1     Juan        Cobos       juan@hotmail.com
    Bloque2     12345678        Ecuador
    Final




*** Keywords ***
Inicio
    [Documentation]    Practica uno nivel intermedio
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Datos Personales | TestingQaRvn     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

Final
    Sleep    2
    close browser

Bloque1
    #Recibir parametros
    [Arguments]   ${name}       ${ap}       ${email}
    input text    name=field_21     ${name}
    input text    name=field_22     ${ap}
    input text    name=field_23     ${email}

Bloque2
    [Arguments]     ${telf}     ${Dir}
    input text    name=field_24     ${telf}
    input text    name=field_28     ${Dir}