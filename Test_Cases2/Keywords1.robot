*** Settings ***
Documentation    Practica Dos
Library     SeleniumLibrary

*** Variables ***
${url}=     https://demoqa.com/text-box
${navegador}=      chrome
${t}=   .2
${name}=    id=userName
${email}=   id=userEmail
${dir1}=    id=currentAddress



*** Test Cases ***
Practica uno Validando título
    Cargando Global




*** Keywords ***
Cargando el navegador
    [Documentation]     Validando el título de la página
    [Tags]    test_uno
    open browser    ${url}    ${navegador}
    maximize browser window
    #Validando el título
    title should be    DEMOQA

Validar nombre
    element should be visible    ${name}
    element should be enabled    ${name}
    input text    id=userName   rodrigo
    sleep    ${t}

Validar email
    element should be visible    ${email}
    element should be enabled    ${email}
    input text    id=userEmail      rodrigo@gmail.com
    sleep    ${t}
Cargar direcciones
    input text    id=currentAddress     dirección uno
    sleep    ${t}
    input text    id=permanentAddress   Dirección dos
    sleep    ${t}
Final
    execute javascript      window.scrollTo(0,200)
    sleep    ${t}
    click button    id=submit
    close browser
Cargando Global
    Cargando el navegador
    Validar Nombre
    Cargar Direcciones
    Final