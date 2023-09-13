*** Settings ***
Documentation    Practica Compare Images
Library  SeleniumLibrary
Library    ../CompareImages/Funciones1.py
Library    DataDriver   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Test_Cases2/Files/Data1.xlsx    sheet_name=Hoja4

Test Template    CompareImagesExample

*** Variables ***

*** Test Cases ***

Prueba Compare Images using      ${link}     ${locator}

*** Keywords ***

CompareImagesExample
    [Documentation]    Comparando Imagenes
    [Arguments]    ${link}      ${locator}
    ${Result}=    Compare Images    ${link}      ${locator}
    log to console        ${Result}
    IF    $Result < 90
        Fail    msg=The images do not meet the minimum percentage of similarity
    ELSE
        Pass Execution    msg=Same images
        
    END