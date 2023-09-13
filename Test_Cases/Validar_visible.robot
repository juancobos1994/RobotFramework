*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary

*** Variables ***
${Url}=   https://demoqa.com/text-box
${Navegador}=   Chrome
${Nombre}=   Juan
${Email}=   juan@hotmail.com
${DireccionUno}=   Direccion1
${DireccionDos}=   Direccion2

${t}=   .2

*** Test Cases ***

Demo Uno Validando titulo
    [Documentation]    Validando titulo de la pagina
    [Tags]    Test_Uno
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    #Validando el titulo
    title should be    DEMOQA
    Sleep    ${t}
    ${name} =   set variable    id=userName
    ${mail} =   set variable    id=userEmail
    #Validar que el campo este visible
    element should be visible    ${name}
    #Validar que el elemento este hanilitado
    element should be enabled    ${name}
    input text    id=userName   ${Nombre}
    Sleep    ${t}
    #Validar que el campo este visible
    element should be visible    ${mail}
    #Validar que el elemento este hanilitado
    element should be enabled    ${mail}
    input text    id=userEmail  ${Email}
    input text    id=currentAddress     ${DireccionUno}
    input text    id=permanentAddress   ${DireccionDos}
    Sleep    ${t}
    execute javascript    window.scrollTo(0,300)
    Sleep    ${t}
    click button    id=submit
    close browser

Validando por atributo
    [Documentation]    Validando por atributo
    [Tags]    Test_Dos
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    #Validando el titulo
    title should be    DEMOQA
    Sleep    ${t}
    ${name} =   set variable    id=userName
    ${mail} =   set variable    id=userEmail
    ${dir1} =   set variable    id=currentAddress
    #Validar que el campo este visible
    element should be visible    ${name}
    #Validar que el elemento este hanilitado
    element should be enabled    ${name}
    input text    id=userName   ${Nombre}
    Sleep    ${t}
    #Validar que el campo este visible
    element should be visible    ${mail}
    #Validar que el elemento este hanilitado
    element should be enabled    ${mail}
    input text    id=userEmail  ${Email}
    #Validando por el atributo
    element attribute value should be   ${dir1}     placeholder     Current Address
    input text    id=currentAddress     ${DireccionUno}
    Sleep    ${t}
    input text    id=permanentAddress   ${DireccionDos}
    Sleep    ${t}
    execute javascript    window.scrollTo(0,300)
    Sleep    ${t}
    click button    id=submit
    close browser


Validando por Negacion
    [Documentation]    Validando por negacion
    [Tags]    Test_tres
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    #Validando el titulo
    title should be    DEMOQA
    Sleep    ${t}
    ${name} =   set variable    id=userNamee
    ${mail} =   set variable    id=userEmail
    ${dir1} =   set variable    id=currentAddress
    #Validar que el campo no este visible
    element should not be visible   ${name}
    input text    id=userName   ${Nombre}
    Sleep    ${t}
    #Validar que el campo este visible
    element should be visible    ${mail}
    #Validar que el elemento este hanilitado
    element should be enabled    ${mail}
    input text    id=userEmail  ${Email}
    #Validando por el atributo
    element attribute value should be   ${dir1}     placeholder     Current Address
    input text    id=currentAddress     ${DireccionUno}
    Sleep    ${t}
    input text    id=permanentAddress   ${DireccionDos}
    Sleep    ${t}
    execute javascript    window.scrollTo(0,300)
    Sleep    ${t}
    click button    id=submit
    close browser

*** Keywords ***

