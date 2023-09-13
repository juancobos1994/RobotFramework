*** Settings ***
Documentation    Practica Login
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot
Library    DataDriver   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Data1.xlsx    sheet_name=Hoja3

Test Setup    Start    
Test Teardown    End
Test Template    Validate1

*** Variables ***
${Url}=     https://practicetestautomation.com/practice-test-login/
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno using    ${username}     ${password}
    


*** Keywords ***

Start
    [Documentation]    EjemploLogin
    [Tags]    Test
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Test Login | Practice Test Automation     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    
Validate1          #Username empty - Password empty  // Username incorrect - Password empty // Username incorrect - Password correct // Username incorrect - Password incorrect 
    [Documentation]    Validate User
    [Arguments]    ${username}      ${password}

    F_texto    id=username    ${username}
    F_texto    id=password    ${password}
    Click Button    id=submit

    Wait Until Page Contains    Your username is invalid!
    Log To Console    First Message:Your username is invalid!

    Log To Console    ${username}
    Log To Console    ${password}


Validate_Username
    [Documentation]    Validate User
    [Arguments]    ${username}      ${password}

    F_texto    id=username    ${username}
    F_texto    id=password    ${password}
    Click Button    id=submit

    Wait Until Page Contains    Your username is invalid!
    Log To Console    First Message:Your username is invalid!

    Log To Console    ${username}
    Log To Console    ${password}
End
    Sleep    2
    close browser