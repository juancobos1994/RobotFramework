*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ruta_foto_guardar}=   C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/reporte2/IMG/

*** Keywords ***
F_texto
    [Arguments]    ${sel}       ${dato}
    wait until element is visible    ${sel}
    wait until element is enabled    ${sel}
    element should be visible    ${sel}
    clear element text    ${sel}
    execute javascript    window.scrollTo(0,50)
    input text    ${sel}    ${dato}
    capture element screenshot    ${sel}   ${ruta_foto_guardar}${dato}.png
    [Return]    El dato se inserto correctamente    ${sel}  ${dato}

F_enter
    [Arguments]    ${sel}
    wait until element is visible    ${sel}
    wait until element is enabled    ${sel}
    element should be visible    ${sel}
    Press Keys  ${sel}     ENTER
    [Return]    Se da Enter en el elemento  ${sel}

F_foto_pagina
    [Arguments]    ${nombre}
    capture page screenshot     ${ruta_foto_guardar}${nombre}
    [Return]    Se captura la pantalla completa

F_foto_elemento
    [Arguments]    ${nombre}        ${sel}
    wait until element is visible    ${sel}
    wait until element is enabled    ${sel}
    element should be visible    ${sel}
    capture element screenshot    ${sel}   ${ruta_foto_guardar}${nombre}
    [Return]    Se captura imagen del elemento  ${sel}

F_scroll
    [Documentation]    Sirve para el scroll en una pagina
    [Arguments]     ${x}    ${y}
    execute javascript    window.scrollTo(${x},${y})

F_click_xy
    [Documentation]    Click sobre un elemento con coordenadas
    [Arguments]    ${sel}   ${x}    ${y}
    click element at coordinates    ${sel}  ${x}    ${y}