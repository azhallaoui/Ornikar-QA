
*** Variables ***
# Valid Test Data
${BASE_URL}    https://www.ornikar.com/
${BROWSER}     chromium

&{VALID_PERSONAL_DATA}
...    first_name=Boris
...    last_name=Becker
...    email=kuknigopsa@gufum.com
...    password=NONE
...    phone=077472771
...    birth_date=01/01/1990
...    postal_code=59100
...    gender=Homme
# Unvalid Test Data
&{UNVALID_PERSONAL_DATA}
...    first_name=''
...    last_name=''
...    email=invalidemail@gufum.com
...    password=Ornisss@4321
...    phone=077471
...    birth_date=01/01/1890
...    postal_code=22100
...    gender=Alien
# Vehicle data
&{VALID_VEHICLE_DATA}
...    license_plate=CT-851-JA
...    version=VOLKSWAGEN POLO 1.6 TDI 90 STYLE
...    brand=VOLKSWAGEN
...    model=POLO
...    year=2020
...    date_purchase=01/01/2025


   
