*** Settings ***
Documentation    Demo Frames
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://testpages.herokuapp.com/frames/index.html
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Frames
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window

    title should be    Frameset Example Title (Example 6)     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    select frame    name=menu           #Cuando una pagina contiene diferentes Frames, es necesario seleccionar el frame donde se va a dar clic un elemento
    click link      xpath=/html/body/p/a
    unselect frame                      #Antes de utilizar otro frame es necesario quitar la seleccion al Frame


    select frame    name=topNav
    click link      xpath=/html/body/p/a[2]
    Sleep    2
    close browser


*** Keywords ***

