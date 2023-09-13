*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://demoqa.com/automation-practice-form
${Navegador}=   Chrome
*** Test Cases ***
Demo Uno
    [Documentation]    Practica3
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2
    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    wait until page contains    Practice Form     #Verificar que la pagina tenga un elemento
    wait until page does not contain    Practice Forr     #Verificar que la pagina no tenga un elemento

    input text    id=firstName  Juan
    input text    id=lastName   Cobos
    input text    id=userEmail  Juan@hotmail.com
    click element    xpath=/html/body/div[2]/div/div/div[2]/div[2]/div[2]/form/div[3]/div[2]/div[1]/label
    input text    id=userNumber     0101010101
    #input text    id=dateOfBirthInput   16 May 1994
    execute javascript    window.scrollTo(0,300)
    #input text    id=subjectsInput  English
    #input text    id=subjectsInput  Biology
    click element    xpath=/html/body/div[2]/div/div/div[2]/div[2]/div[2]/form/div[7]/div[2]/div[1]/label
    input text    id=currentAddress     Dirrecion1
    execute javascript    window.scrollTo(0,300)
    element should be visible   id=submit
    click button    /html/body/div[2]/div/div/div[2]/div[2]/div[2]/form/div[11]/div/button

    close browser


Demo Dos
    [Documentation]    Practica3Demo2
    [Tags]    TestDos

    Open Browser    https://testingqarvn.com.es/datos-personales/  ${Navegador}
    maximize browser window
    Sleep    2
    title should be    Datos Personales | TestingQaRvn    #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    input text    id=wsf-1-field-23     Juan
    click button    id=wsf-1-field-27
    Sleep    2
    wait until page contains    Please provide a valid email.           #Validadcion si ingreso un mail correcto
    log to console    Primera Validacion de Email OK
    wait until element is visible    //*[@id="wsf-1-invalid-feedback-23"]
    log to console    Segunda Validacion de Email OK


    close browser
*** Keywords ***

