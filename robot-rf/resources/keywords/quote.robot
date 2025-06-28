*** Settings ***
Library     Browser
Resource        ../keywords/home.robot
Resource        ../pages/quote.robot
Library         DateTime
*** Keywords ***

The User Is On The Insurance Quote Page
    The user is on the Insurance page
    Click             ${BTN DEVIS}
    Switch Page       NEW

I Choose Search By Licence Plate And Click Continue
    Click    ${SEARCH_CAR_BY_PLATE}

I Enter The valid ${license_plate}
    Type Text    ${INPUT LICENCE PLATE}    ${license_plate}
    Log To Console    Click Confirmer
    Click    ${BUTTON NEXT STEP} 
    
I Choose The Vehicle ${version}
    Log To Console    Select vehicle version
    Click    ${SELECT VEHICLE VERSION}
    ${VERSION}    Set Variable    ${version}
    Click    //*[text()="${VERSION}"]

I Choose The ${date_purchase} When The Vehicle Was Perchased
    Log To Console    Select Purchase Date
    Click        ${DATE_PICKER}
    Type Text    ${DATE_PICKER}     ${date_purchase}
    Click        ${BUTTON NEXT STEP}

I Choose When I Want My Car Insured By Typing The Date
    Click        ${DATE_PICKER}
    #${TOMORROW}=       Evaluate    (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%d%m%Y')    modules=datetime
    ${TOMORROW}    Get Current Date    increment=1 day    result_format=%d%m%Y
    Log To Console     Select The Date of Insurance Start     ${TOMORROW}
    Type Text    ${DATE_PICKER}    ${TOMORROW}
    Click        ${BUTTON NEXT STEP}
    
I Answer The Qestion Wether The Vehicle Is Actually Ansured By ${answer}
    Log To Console    Votre véhicule est-il actuellement assuré ?
    Log To Console    Answer No
    Click             ${VEHICLE_IS_IT_INSURED}[${answer}] 
    Click        ${BUTTON NEXT STEP}

I Answer The Question How My Vehicle Is Financed By Choosing ${How_My_Vehicle_Is_Financed}
    Log To Console    Merci, dernière question sur votre véhicule. Comment l'avez-vous financé ?
    Click        ${VEHICLE_HOW_IS_IT_FINANCED}[cash]

I Should See All Entred Vehicle Information Befor Confirming ${vehicle_data}
    Wait For Elements State        text=${vehicle_data}[license_plate]    visible
    ${body_text}=    Get Text    body
    Log To Console    ${body_text}
    Should Contain    ${body_text}    ${vehicle_data}[license_plate]
    Should Contain    ${body_text}    ${vehicle_data}[version]
    Should Contain    ${body_text}    ${vehicle_data}[date_purchase]



        