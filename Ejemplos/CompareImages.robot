*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary
Library    ImageCompare
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://www.significados.com/futbol/
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Uno
    [Tags]    VariableUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    Qué es el Fútbol: cómo se juega, cancha y reglas - Significados     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    wait until element is visible    xpath=//*[@id="article"]/p[10]/span[1]/img
    wait until element is enabled    xpath=//*[@id="article"]/p[10]/span[1]/img
    element should be visible    xpath=//*[@id="article"]/p[10]/span[1]/img
    capture element screenshot    xpath=//*[@id="article"]/p[10]/span[1]/img   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/Files/Captura.png

    #Compare two Images and highlight differences
    Compare Images    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/Files/Referencia.jpg    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/Files/Captura.jpg

    Sleep    2
    close browser


*** Keywords ***
