*** Settings ***

Documentation                       Testsvit funktionalitet "Skapa användare"
Resource                            ../Resources/rental29_dateSelection.robot
Library                             SeleniumLibrary
Suite Setup                         Begin Web Test
Suite Teardown                      End Web Test

*** Variables ***
${BROWSER}          chrome
${URL1}             http://rental29.infotiv.net/

*** Test Cases ***

Användaren kan ha åtkomst till Date Selection sidan genom att klicka på "Continue"-knappen.
    [Documentation]                 Date Selection: Testa att knappen "Continue" fungerar.
    [Tags]                          G_Button_ID_1
    Go to Web Page
    Click Button Continue
    Verify Page Car_Selection Loaded

Användaren kan mata egna datum-inputs i inmatningsfälten.
    [Documentation]                 Date Selection: Testa att inmatningsfältena går att skriva eget input.
    [Tags]                          G_Input_ID_2
    Go to Web Page
    Input Date_Left                 0322
    Input Date_Right                0323
    Click Button Continue
    Verify Page Car_Selection Loaded

Användaren kan inte ha åtkomst till boka sidan om man matat in felaktig datum.
    [Documentation]                 Date Selection: Testa felhanteringen om användaren matar tidigare datum än dagens datum.
    [Tags]                          G_Boundries_ID_3A
    Go to Web Page
    Input Date_Left                 0318
    Input Date_Right                0319
    Click Button Continue
    Verify Page Loaded

Användaren kan inte ha åtkomst till boka sidan om man matat in längre period bokningen.
    [Documentation]                 Date Selection: Testa felhanteringen om användaren matar in längre än 30 dagars-bokning.
    [Tags]                          G_Boundries_ID_3B
    Go to Web Page
    Input Date_Left                 0319
    Input Date_Right                0421
    Click Button Continue
    Verify Page Loaded

Användaren kan inte ha åtkomst till boka sidan om man matat in bokning längre period fram än dagens datum.
    [Documentation]                 Date Selection: Testa felhanteringen om användaren matar in datum längre fram.
    [Tags]                          G_Boundries_ID_3C
    Go to Web Page
    Input Date_Left                 0419
    Input Date_Right                0420
    Click Button Continue
    Verify Page Loaded

