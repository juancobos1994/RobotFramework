*** Settings ***
Documentation    Practica Uno Intermedio
Library  SeleniumLibrary
Resource    ../keywords1/keywords_practica1p3.robot

*** Variables ***
${Url}=     https://testingqarvn.com.es/datos-personales/
${Navegador}=   Chrome

*** Test Cases ***
Practica Uno Keywords
    Inicio
    Bloque1     Juan        Cobos       juan@hotmail.com
    Bloque2     12345678        Ecuador
    Final




