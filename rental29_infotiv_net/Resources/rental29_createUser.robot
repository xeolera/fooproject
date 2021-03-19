*** Keywords ***

Begin Web Test
    Open browser                       about:blank             ${BROWSER}
    Set selenium timeout               15

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                              ${URL1}

Verify Page Loaded
    ${LINK_TEXT}                       Get Title
    Should Be Equal                    ${LINK_TEXT}      Infotiv Car Rental

Click Button CreateUser
    Click Element                      xpath://*[@id="createUser"]

Verify Page_userRegistration Loaded
    ${LINK_TEXT}                       Get Title
    Should Be Equal                    ${LINK_TEXT}      Create user

Click Element input_firstName
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="name"]    ${SEARCH_TERM}

Click Element input_lastName
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="last"]    ${SEARCH_TERM}

Click Element input_phone
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="phone"]   ${SEARCH_TERM}

Click Element input_createEmail
   [Arguments]                         ${SEARCH_TERM}
    Input Text                         xpath://*[@id="emailCreate"]   ${SEARCH_TERM}

Click Element input_confirmEmail
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="confirmEmail"]   ${SEARCH_TERM}

Click Element input_createPassword
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="passwordCreate"]   ${SEARCH_TERM}

Click Element input_confirmPassword
    [Arguments]                        ${SEARCH_TERM}
    Input Text                         xpath://*[@id="confirmPassword"]   ${SEARCH_TERM}

Click Button Create
    Click Element                      xpath://*[@id="create"]
    Wait Until Page Contains Element   id:welcomePhrase
    Page Should Contain                You are signed in as Stefan

Click Button My_Page
    Click Element                      xpath://*[@id="mypage"]
    ${LINK_TEXT}                       Get Title
    Should Be Equal                    ${LINK_TEXT}      Mypage

End Web Test
    Close browser