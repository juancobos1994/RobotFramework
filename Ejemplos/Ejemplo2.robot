*** Settings ***
Library    SeleniumLibrary    run_on_failure=Log Source
Variables    vars.py



*** Test Cases ***
Foo
    Create Webdriver    Chrome    desired_capabilities=${binary_location}
    Wait Until Page Contains Element    id=backgroundImage
    [Teardown]    Close All Browsers