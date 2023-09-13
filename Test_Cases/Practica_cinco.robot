*** Settings ***
Documentation    Practica Cinco Funciones Clic
Library  SeleniumLibrary

*** Variables ***
${Url}=     https://testpages.herokuapp.com/frames/index.html
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Practica Cinco
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Frameset Example Title (Example 6)    #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    select frame    name=menu           #Cuando una pagina contiene diferentes Frames, es necesario seleccionar el frame donde se va a dar clic un elemento
    click link      xpath=/html/body/p/a
    unselect frame                      #Antes de utilizar otro frame es necesario quitar la seleccion al Frame
    Sleep    2
    close browser

    Open Browser    https://www.htmlelements.com/demos/button/overview/index.htm    ${Navegador}
    click button    id=Id_Botton
    close browser
    Sleep    2

    #Clic Por coordenadas
    click element at coordinates    xpath=Path_Elemento     CoordenadaX     CoordenadaY

    #Clic Sobre una imagen
    click image    xpath=Xpath_imagen

    close browser

*** Keywords ***

