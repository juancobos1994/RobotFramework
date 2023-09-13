*** Settings ***
Documentation    Practica Base de datos MySQL
Library  SeleniumLibrary
Library    DatabaseLibrary
Library    OperatingSystem
Resource    ../keywords1/Funciones.robot

Suite Setup     Connect To Database     pymysql      ${dbname}   ${dbuser}    ${dbpass}    ${dbhost}    ${dbport}
Suite Teardown    Disconnect From Database

*** Variables ***
${Url}=     https://www.techlistic.com/p/selenium-practice-form.html
${Navegador}=   Chrome

${dbname}=  sistema_dos
${dbuser}=  Juan
${dbpass}=  12345
${dbhost}=  127.0.0.1       #localhost
${dbport}=  3306

*** Test Cases ***

Base crear tabla
    [Documentation]    Crear una nueva tabla en la base
    [Tags]    test_crear_tabla
    ${crear}=   Execute Sql String  CREATE TABLE `personas3` (`id` int(11) NOT NULL, `name` varchar(40) NOT NULL, `lastname` varchar(40) NOT NULL);
    Log To Console    ${crear}
    should be equal as strings    ${crear}  None

Base insertar registro
    [Documentation]    Insertar nuevo registro a la tabla
    [Tags]    test_insertar_registro
    #${insertar}=    Execute Sql String    insert into personas2 (`id`,`name`,`lastname`) VALUES (01,"Pedro","Loja")
    ${insertar}=    Execute Sql Script    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/Files/Insertar.sql
    log to console    ${insertar}
    should be equal as strings    ${insertar}   None


*** Keywords ***

