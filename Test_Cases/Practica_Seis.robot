*** Settings ***
Documentation    Practica Seis Validando un Login
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Validamdo user y password incorrectos
    [Tags]    LoginUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Juan
    ${pass}=    set variable    123456

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
    log to console    Primer error encontrado OK
    wait until page contains    Invalid credentials
    log to console    Error esperado OK = Invalid credentials
    Sleep    2
    close browser

Demo Dos
    [Documentation]    Validamdo user y password incorrectos
    [Tags]    LoginUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Admin
    ${pass}=    set variable    123456

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
    log to console    Segundo error encontrado OK
    wait until page contains    Invalid credentials
    log to console    Error esperado OK = Invalid credentials
    Sleep    2
    close browser

Demo Tres
    [Documentation]    Validamdo user erroneo y password OK
    [Tags]    LoginTres

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Juan
    ${pass}=    set variable    admin123

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
    log to console    Primer error encontrado OK
    wait until page contains    Invalid credentials
    log to console    Error esperado OK = Invalid credentials
    Sleep    2
    close browser

Demo Cuatro
    [Documentation]    Validamdo user vacio y password incorrecto
    [Tags]    LoginCuatro

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable
    ${pass}=    set variable    123456

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span
    log to console    Cuarto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado OK = Required
    Sleep    2
    close browser

Demo Quinto
    [Documentation]    Validamdo user correcto y password vacio
    [Tags]    LoginQuinto

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Admin
    ${pass}=    set variable

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/span
    log to console    Quinto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado OK = Required
    Sleep    2
    close browser

Demo Seis
    [Documentation]    Validamdo user vacio y password vacio
    [Tags]    LoginSeis

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable
    ${pass}=    set variable

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button


    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span
    log to console    Sexto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado OK = Required
    Sleep    2

    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/span
    log to console    Sexto error encontrado OK
    wait until page contains    Required
    log to console    Error esperado OK = Required
    close browser

Demo Siete
    [Documentation]    Validamdo user incorrecto y password correcto
    [Tags]    LoginSeptimo

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Aaaaaaaa
    ${pass}=    set variable    admin123

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

    wait until element is visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
    log to console    Septimo error encontrado OK
    wait until page contains    Invalid credentials
    log to console    Error esperado OK = Invalid credentials
    Sleep    2
    close browser

Demo Ocho
    [Documentation]    Validamdo user correcto y password correcto
    [Tags]    LoginOcho

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    OrangeHRM     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    ${user}=    set variable    Admin
    ${pass}=    set variable    admin123

    input text    name=username     ${user}
    input text    name=password     ${pass}
    click button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

    Sleep    2
    close browser
*** Keywords ***

