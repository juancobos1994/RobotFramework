*** Settings ***
Documentation    Practica Excel1
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot
Library    DataDriver   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Data1.xlsx    sheet_name=Hoja1

Test Setup    Inicio
Test Teardown    Final
Test Template    ConectarExcel

*** Variables ***
${Url}=     https://demoqa.com/text-box
${Navegador}=   Chrome


*** Test Cases ***

Prueba uno Excel using      ${name}     ${email}



*** Keywords ***

Inicio
    [Documentation]    Practica Excel
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

ConectarExcel
    [Documentation]    Conectando con excel
    [Arguments]    ${name}      ${email}
    F_texto    id=userName      ${name}
    F_texto    id=userEmail     ${email}

Final
    Sleep    2
    close browser