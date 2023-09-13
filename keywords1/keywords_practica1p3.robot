*** Settings ***
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

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
    F_texto     name=field_21     ${name}
    F_texto     name=field_22     ${ap}
    F_texto     name=field_22     ${ap}
    F_texto    name=field_23     ${email}
    #input text    name=field_21     ${name}
    #input text    name=field_22     ${ap}
    #input text    name=field_23     ${email}

Bloque2
    [Arguments]     ${telf}     ${Dir}
    input text    name=field_24     ${telf}
    input text    name=field_28     ${Dir}
