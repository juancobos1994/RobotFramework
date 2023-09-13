*** Settings ***
Documentation    Drag and drop
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

Suite Setup    Inicio
Suite Teardown    Fin
*** Variables ***
${Url}=     https://demoqa.com/droppable
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    drag and drop    id=draggable       id=droppable    #Mover un elemento a otro elemento

Demo Dos
    drag and drop by offset    id=draggable       200       50      #Mover un elemento por coordenadas



*** Keywords ***

Inicio
    [Documentation]    DragDrop
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

Fin
    Sleep    2
    close browser