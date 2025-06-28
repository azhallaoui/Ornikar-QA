*** Settings ***
Library    Browser
Resource   ../resources/pages/login.robot
Resource   ../resources/keywords/login.robot
Resource   ../resources/keywords/quote.robot
Test Teardown  Run Keywords
    ...       Take Screenshot
    ...       Close Browser  

*** Test Cases ***
Successful login with valid credentials
    [Tags]    valid    login
    Given The user is on the Insurance page
    WHEN The user Logs in WITH ${VALID_PERSONAL_DATA}[email] and ${VALID_PERSONAL_DATA}[password]
    Then The dashboard should be displayed

Unccessful login with unvalid credentials
    [Tags]    unvalid    login
    Given The user is on the Insurance page
    WHEN The user Logs in WITH ${UNVALID_PERSONAL_DATA}[email] and ${UNVALID_PERSONAL_DATA}[password]
    Then The message Vos identifiants semblent incorrects is diplayed


Verify the login page layouts
    [Tags]    unvalid    login
    Given The user is on the Insurance page
    WHEN The user Logs in WITH ${UNVALID_PERSONAL_DATA}[email] and ${UNVALID_PERSONAL_DATA}[password]
    Then The message Vos identifiants semblent incorrects is diplayed


    