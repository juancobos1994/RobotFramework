*** Settings ***
Documentation    Demo Radio Buttons
Library  SeleniumLibrary

*** Variables ***
${Url}=   https://demoqa.com/radio-button
${Navegador}=   Chrome
${t}=   .2

*** Test Cases ***
Demo Uno
    [Documentation]    Demo Radio Button
    [Tags]    TestUno
    Open Browser    ${Url}  ${Navegador}
    maximize browser window
    #Validando el titulo
    title should be    DEMOQA
    Sleep    ${t}
    #Seleccionar un radio button por su name y su value
    #select radio button     like    Yes
    #Sleep    2

    #Seleccionar dando click
    click element    xpath=//*[@id="app"]/div/div/div[2]/div[2]/div[2]/div[3]/label
    Sleep    2
    close browser


*** Keywords ***

