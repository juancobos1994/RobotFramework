*** Settings ***
Documentation    Practica For
Library  SeleniumLibrary
Library    String
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://testpages.herokuapp.com/styled/basic-html-form-test.html
${Navegador}=   Chrome
${Imagen}=  C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Img1.jpg


*** Test Cases ***
Demo Uno

    FOR     ${i}    IN RANGE    0   10
        Inicio
        Bloque_Uno
        Bloque_Dos
        Bloque_Tres
        Final
    END





*** Keywords ***
Inicio
    [Documentation]    Practica For
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2
    title should be     HTML Form Elements     #Validando el titulo
    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea
    wait until page contains    Basic HTML Form Example

Bloque_Uno
    [Documentation]    Bloque Uno
    ${numbers}=     Generate random string  5   1000
    F_texto    xpath=//input[contains(@name,'username')]    Nombre #${numbers}
    ${numbers}=     Generate random string  5   1000
    F_texto    xpath=//input[contains(@type,'password')]    ${numbers}
    ${numbers}=     Generate random string  5   1000
    F_texto    xpath=//textarea[contains(@name,'comments')]     Primer Comentario${numbers}

Bloque_Dos
    [Documentation]    Bloque_Dos
    choose file    xpath=//input[contains(@type,'file')]     ${imagen}
    click element    xpath=//input[contains(@value,'cb1')]
    click element    xpath=//input[contains(@value,'cb2')]
    click element    xpath=//input[contains(@value,'cb3')]

Bloque_Tres
    [Documentation]    Bloque_Tres
    select from list by index    xpath=//select[contains(@multiple,'multiple')]     2
    sleep    1
    select from list by index    xpath=//select[contains(@name,'dropdown')]     2
    sleep    1
    click element    //input[contains(@value,'rd1')]
    sleep    1
    click button    //input[contains(@type,'submit')]
Final
    Sleep    2
    close browser