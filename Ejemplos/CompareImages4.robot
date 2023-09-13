*** Settings ***
Documentation    Practica Dos
Library  SeleniumLibrary
Library    ImageCompare
Library  ../Ejemplos/FunctionsCompareImages.py

*** Variables ***
${img1}=    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg
${img2}=    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg


*** Test Cases ***
Demo Uno
    [Documentation]    Demo Uno
    [Tags]    TestUno

    ${Result1}=    Compare Images Size    ${img1}    ${img2}
    log to console        ${Result1}

Demo Dos
    [Documentation]    Demo Dos
    [Tags]    TestDos

    ${Result2}=    Compare Image RGB    ${img1}    ${img2}
    log to console        ${Result2}

Demo Tres
    [Documentation]    Demo Tres
    [Tags]    TestTres

    ${Result3}=    Compare Image Similarity    ${img1}    ${img2}
    log to console        ${Result3}