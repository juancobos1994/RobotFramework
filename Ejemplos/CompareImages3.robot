*** Settings ***
Library   SeleniumLibrary
Library  DocTest.VisualTest    show_diff=True    take_screenshots=True    screenshot_format=png 

*** Variables ***
${REFERENCE}    C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata

*** Test Cases ***
Check Amazon Site
    Open Browser    url=https://www.amazon.com    browser=Chrome
    ${img}    Capture Element Screenshot    locator=//input[contains(@type,"submit")]        
    Compare Images    ${REFERENCE}/reference.png    ${img}    threshold=0.00005

Check Amazon Site1
    Open Browser    url=https://www.amazon.com    browser=Chrome
    ${img}    Capture Element Screenshot    locator=//input[contains(@type,"submit")]        
    Compare Images    ${REFERENCE}/reference1.png    ${img}    threshold=0.00005