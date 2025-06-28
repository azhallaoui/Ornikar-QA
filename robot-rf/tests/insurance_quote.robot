*** Settings ***
Library    Browser
Resource   ../resources/keywords/quote.robot

*** Test Cases ***
Verify Successful Quote Generation With &{VALID_VEHICLE_DATA}
    [Documentation]    This test is filling all the vehicle information in the vehicle form
    ...                This is a smoke test
    [Tags]    smoke    happy-path    quote
    Given The User Is On The Insurance Quote Page
    When I Choose Search By Licence Plate And Click Continue
    And I Enter The valid ${VALID_VEHICLE_DATA}[license_plate]
    And I Choose The Vehicle ${VALID_VEHICLE_DATA}[version]
    And I Choose The ${VALID_VEHICLE_DATA}[date_purchase] When The Vehicle Was Perchased
    And I Choose When I Want My Car Insured By Typing The Date 
    And I Answer The Qestion Wether The Vehicle Is Actually Ansured By no
    And I Answer The Question How My Vehicle Is Financed By Choosing cash
    Then I Should See All Entred Vehicle Information Befor Confirming &{VALID_VEHICLE_DATA}