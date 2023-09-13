*** Settings ***
Documentation    Upload File
Library  SeleniumLibrary
Resource    ../keywords1/Funciones.robot

*** Variables ***
${Url}=     https://demoqa.com/automation-practice-form
${Navegador}=   Chrome

*** Test Cases ***
Demo Uno
    [Documentation]    UploadFile
    [Tags]    TestUno

    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    Sleep    2

    title should be    DEMOQA     #Validando el titulo

    set selenium implicit wait    10    #Tiempo maximo de espera para que aparezca un elemento
    set selenium speed    .1s           #Definir el tiempo de espera entre la ejecucion de cada linea

    F_scroll    0   200


choose file    id=uploadPicture     C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Img1.jpg
    Sleep    2
    close browser


*** Keywords ***

