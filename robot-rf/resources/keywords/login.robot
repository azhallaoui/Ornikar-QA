*** Settings ***
Library     Browser
Resource    ../pages/login.robot
Resource    ../keywords/home.robot
*** Keywords ***
    
The user Logs in WITH ${D input email} and ${D_password}
    Click    ${X GO TO SIGN IN}
    Click    ${X_INSSURANCE_GO_TO_SIGN_IN} 
    Switch Page    NEW
    Fill Text      ${X_EMAIL}      ${D input email}
    Fill Secret    ${X_PASSWORD_}       $D_password
    Click          ${BTN_LOGINSCREEN_SUBMIT}
The dashboard should be displayed
    Log To Console    "Displaying Inssurance Dashboard"

The message ${msg} is diplayed
    Wait For Elements State    ${X_TOAST_MESSAGE}    visible
    ${text}    Get Text        ${X_TOAST_MESSAGE}//*[text()="${msg}"]
    Should Contain      ${text}    ${msg}
