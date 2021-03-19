*** Settings ***

Documentation                       Testsvit funktionalitet "Skapa användare"
Resource                            ../Resources/rental29_createUser.robot
Library                             SeleniumLibrary
Suite Setup                         Begin Web Test
Suite Teardown                      End Web Test

*** Variables ***
${BROWSER}          chrome
${URL1}             http://rental29.infotiv.net/
${URL2}             http://rental29.infotiv.net/webpage/html/gui/userRegistration.php

*** Test Cases ***

Användaren har åtkomst till skapa användare-sidan.
    [Documentation]                      Create user: Testa om det går att gå vidare till "userRegistration" via 'Create User'-knappen.
    [Tags]                               G_ID1
    Go to Web Page
    Click Button CreateUser
    Verify Page_userRegistration Loaded


Användaren kan mata in för- och efternamn i boxarna.
    [Documentation]                      Create user: Testa att mata in data i förnamn och efternamn rutorna.
    [Tags]                               G_ID2
    Go to                                ${URL2}
    Verify Page_userRegistration Loaded
    Click Element input_firstName        Stefan
    Click Element input_lastName         Nikolic

Användaren skapar användare
    [Documentation]                      Create user: Testa skapa ny användare via 'Create'-knappen efter man matat in all information i 'Create User'-sidan
    [Tags]                               G_ID3
    Go to                                ${URL2}
    Verify Page_userRegistration Loaded
    Click Element input_firstName        Stefan
    Click Element input_lastName         Nikolic
    Click Element input_phone            0765505218
    Click Element input_createEmail      test18@hotmail.com
    Click Element input_confirmEmail     test18@hotmail.com
    Click Element input_createPassword   123456
    Click Element input_confirmPassword  123456
    Click Button Create
    Click Button My_Page

