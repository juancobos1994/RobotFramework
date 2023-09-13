*** Settings ***
Documentation    Demo Variables
Library  SeleniumLibrary

*** Variables ***
${nombre}   =   Juan
${ape}  =   Cobos
${am}   =   Quinde

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Uno
    [Tags]    VariableUno
    Log    ${nombre} ${ape} ${am}

Demo Dos
    [Documentation]    Demo Dos
    [Tags]    VariableDos
    Log    ${nombre} ${ape} ${am}

Demo Tres
    [Documentation]    Demo Tres
    [Tags]    VariableTres
    Log    ${nombre} ${ape} ${am}
    ${a} =  set variable    10
    ${b} =  set variable    20
    ${suma} =  evaluate    ${a}+${b}
    ${multi} =  evaluate    ${a}*${b}

    log to console    ${a}
    log to console    ${b}
    log to console    ${suma}
    log to console    ${multi}



*** Keywords ***

