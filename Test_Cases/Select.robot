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
    Sleep    ${t}

    element should be visible   dropdown
    select from list by label   dropdown  Option 1
    Sleep    ${t}

    select from list by value   dropdown  2
    Sleep    ${t}

    select from list by index   dropdown  1
    Sleep    ${t}
    close browser
*** Keywords ***

