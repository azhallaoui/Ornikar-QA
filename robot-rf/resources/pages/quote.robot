*** Variables ***
${BTN DEVIS}                   //*[@action_type="Go To Signup"]
${BUTTON NEXT STEP}           //*[@data-testid="quoteFlow.button.nextStep"]
${DATE_PICKER}               //*[@data-testid="kitt.KeyboardDatePicker.day"]

#VEHICLE RELEATED
${SEARCH_CAR_BY_PLATE}        //*[@data-testid="button.VehicleSearchChoiceScreen.searchCarByPlate"]
${INPUT LICENCE PLATE}        //*[@data-testid="field.VehicleLicensePlateScreen.vehicleImmatriculation"]
${SELECT VEHICLE VERSION}     //*[@data-testid="autocomplete.VersionAutocomplete.vehicleVersion"]
#Votre véhicule est-il actuellement assuré ?
&{VEHICLE_IS_IT_INSURED}
    ...    yes=//*[@data-testid="vehicleDejaAssureAvecNom-1"]
    ...    yes_but_not_in_my_name=//*[@data-testid="vehicleDejaAssureAvecNom-0"]
    ...    no=//*[@data-testid="vehicleDejaAssureAvecNom-0"]

#Merci, dernière question sur votre véhicule. Comment l'avez-vous financé ?
&{VEHICLE_HOW_IS_IT_FINANCED}
    ...    cash=//*[@data-testid="fundingMethodScreen-1"]     #Paid in full (cash)
    ...    loan=//*[@data-testid="fundingMethodScreen-2"]     #On credit (loan)
    ...    LLD=//*[@data-testid="fundingMethodScreen-3"]      #Long-term lease (LLD)
    ...    LOA=//*[@data-testid="fundingMethodScreen-4"]      #Lease with an option to buy (LOA)
    ...    other=//*[@data-testid="fundingMethodScreen-5"]    #Other (inheritance, gift, etc.)
