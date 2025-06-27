*** Settings ***
Library    Dialogs
Library    Browser
Resource   ../resources/keywords/quote.robot

*** Test Cases ***
Verify Successful Quote Generation
    [Documentation]    Test successful insurance quote with valid data
    [Tags]    smoke    happy-path    quote
    Given The User Is On The Insurance Quote Page
    Click        //*[@data-testid="button.VehicleSearchChoiceScreen.searchCarByPlate"]
    The User Fill My Vehicle Form With ${VALID_VEHICLE_DATA}
    

