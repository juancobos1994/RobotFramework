*** Settings ***
Documentation    Prueba Alerts
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://testpages.herokuapp.com/styled/alerts/alert-test.html
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Prueba Alerts
    [Tags]    TestUno
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Test Page For JavaScript Alerts     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .8s           #Definir el tiempo de espera entre la ejecucion de cada linea

    click button    id=alertexamples
    handle alert    accept
    Sleep    2

    click button    id=confirmexample
    handle alert    accept
    Sleep    2

    click button    id=confirmexample
    handle alert    dismiss
    Sleep    2

    click button    id=alertexamples
    alert should be present    I am an alert box!
    Sleep    2
    close browser
*** Keywords ***

