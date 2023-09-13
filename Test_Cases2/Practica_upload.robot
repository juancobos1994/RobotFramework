*** Settings ***
Documentation    Practica Upload
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://demoqa.com/automation-practice-form
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    Inicio
    Bloque_Uno
    Bloque_Dos
    Bloque_tres
    Bloque_Cuatro
    Bloque_Cinco
    Final




*** Keywords ***
Inicio
    [Documentation]    Practica Upload
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

Final
    [Documentation]    Cerrando el navegador
    Sleep    2
    close browser

Bloque_Uno
    [Documentation]    Bloque Uno
    F_texto    id=firstName     Juan
    F_texto    id=lastName     Cobos
    F_texto    id=userEmail     Juan@hotmail.com

Bloque_Dos
    [Documentation]    Bloque Dos
    click element    //label[@for='gender-radio-1'][contains(.,'Male')]
    F_texto    id=userNumber    1234567891
    click element    dateOfBirthInput
    select from list by value   //select[contains(@class,'month-select')]  4
    select from list by value    //select[contains(@class,'year-select')]   1994
    click element    //div[contains(@class,'react-datepicker__day react-datepicker__day--016')]

Bloque_tres
    [Documentation]    Bloque_tres
    Press Keys    xpath=//*[@id="subjectsContainer"]/div/div[1]  English
    click element at coordinates    xpath=//*[@id="subjectsContainer"]/div/div[1]   0   50

Bloque_Cuatro
    [Documentation]    Bloque Cuatro
    click element    //label[@for='hobbies-checkbox-1'][contains(.,'Sports')]
    choose file    id=uploadPicture     C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Img1.jpg
    F_scroll    0   2500
    F_texto    id=currentAddress    Direccion

Bloque_Cinco
    [Documentation]    Bloque Cinco
    click element    xpath=//div[@class=' css-1wa3eu0-placeholder'][contains(.,'Select State')]
    F_click_xy    xpath=//div[@class=' css-1wa3eu0-placeholder'][contains(.,'Select State')]  0   50
    click element    xpath=//div[@class='col-md-4 col-sm-12'][contains(.,'Select City')]
    F_click_xy    xpath=//div[@class='col-md-4 col-sm-12'][contains(.,'Select City')]  0   50
    click button    id=submit