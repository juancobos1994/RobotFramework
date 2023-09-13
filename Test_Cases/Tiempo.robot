*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary

*** Variables ***
${Url}=   http://the-internet.herokuapp.com/dropdown
${Navegador}=   Chrome
${t}=   .2

*** Test Cases ***
Demo Uno
    [Documentation]    Selector
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    #Validando el titulo
    title should be    The Internet

    ${tiempo}=  get selenium timeout
    Log To Console    ${tiempo}

    ${tiempo}=  get selenium implicit wait
    Log To Console    ${tiempo}

    set selenium implicit wait    50    #Tiempo maximo de espera para que aparezca un elemento
    set selenium timeout    15         #Funcion para la espera de cargar de los elementos
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea
    element should be visible   dropdown
    select from list by label   dropdown  Option 1


    select from list by value   dropdown  2


    select from list by index   dropdown  1

    close browser
*** Keywords ***

