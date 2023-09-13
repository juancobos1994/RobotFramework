*** Settings ***
Documentation    Practica Uno
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://demoqa.com/text-box
${Navegador}=   Firefox

*** Test Cases ***
Demo Uno
    Inicio
    Fin
    
    
    


*** Keywords ***

Inicio
    [Documentation]    Prueba Uno utilizan Pabot
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea
    F_texto    //input[@id='userName']    Juan

Fin
    Sleep    2
    close browser

#pabot --processes 6 --outputdir Resultados .\Ejemplos\Pruebapa*.robot