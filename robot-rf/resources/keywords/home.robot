*** Settings ***
Library    Browser
Resource    ../pages/home.robot
*** Keywords ***


Open Home Page
    New Browser     ${BROWSER}    headless=True
    New Context
    New Page        ${BASE_URL}

Accept all tracking
    Log To Console    "Accept all tracking cookies"
    Click  id=axeptio_btn_acceptAll

The user is on the Insurance page
    Set Browser Timeout    30s
    Open Home Page
    Accept all tracking
    Click    ${X MENU ASSURANCE}