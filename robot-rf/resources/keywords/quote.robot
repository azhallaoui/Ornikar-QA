*** Settings ***
Library     Browser
Resource        ../keywords/home.robot
Resource        ../pages/quote.robot
Library         DateTime
Library        Dialogs
*** Keywords ***

The User Is On The Insurance Quote Page
    The user is on the Insurance page
    Click             ${BTN DEVIS}
    Switch Page       NEW

The User Fill My Vehicle Form With ${VEHICLE DATA}
    
    #Mon vehicule
    Log To Console    Type vehicle license plate
    Type Text    ${INPUT LICENCE PLATE}    ${VEHICLE DATA}[license_plate]
    Log To Console    Click Confirmer
    Click    ${BUTTON NEXT STEP} 
    Log To Console    Select vehicle version
    Click    ${SELECT VEHICLE VERSION}
    ${VERSION}    Set Variable    ${VEHICLE DATA}[version]
    Click    //*[text()="${VERSION}"]
    Log To Console    Select Purchase Date

    Click        ${DATE_PICKER}
    Type Text    ${DATE_PICKER}     ${VALID_VEHICLE_DATA}[date_purchase]
    Click        ${BUTTON NEXT STEP}
    
    
    Click        ${DATE_PICKER}
    
    #${TOMORROW}=       Evaluate    (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%d%m%Y')    modules=datetime
    ${TOMORROW}    Get Current Date    increment=1 day    result_format=%d%m%Y
    Log To Console     Select The Date of Insurance Start     ${TOMORROW}
    Type Text    ${DATE_PICKER}    ${TOMORROW}
    Click        ${BUTTON NEXT STEP}
    Log To Console    Votre véhicule est-il actuellement assuré ?
    Log To Console    Answer No
    Click             ${VEHICLE_IS_IT_INSURED}[no]
    Log To Console    Depuis quand votre véhicule n'est-il pas assuré ?
    ${TODAY_DATE}    Get Current Date    result_format=%d%m%Y
    Type Text    ${DATE_PICKER}    ${TODAY_DATE}
    Click        ${BUTTON NEXT STEP}
    Log To Console    Merci, dernière question sur votre véhicule. Comment l'avez-vous financé ?
    Click        ${VEHICLE_HOW_IS_IT_FINANCED}[cash]
    
    Wait For Elements State        text=${VEHICLE DATA}[license_plate]    visible
    ${body_text}=    Get Text    body
    Log To Console    ${body_text}
    Should Contain    ${body_text}    ${VEHICLE DATA}[license_plate]
    Should Contain    ${body_text}    ${VEHICLE DATA}[version]
    Should Contain    ${body_text}    ${VALID_VEHICLE_DATA}[date_purchase]
    


    
    