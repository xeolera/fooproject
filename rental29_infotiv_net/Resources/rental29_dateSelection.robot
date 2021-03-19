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
    ${LINK_TEXT}                        Get Title
    Should Be Equal                     ${LINK_TEXT}      Infotiv Car Rental

Click Button Continue
    Click Element                       id:continue

Verify Page Car_Selection Loaded
    Wait Until Page Contains Element    id:questionText
    Page Should Contain                 What would you like to drive?

Input Date_Left
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:start         ${SEARCH_TERM}

Input Date_Right
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:end           ${SEARCH_TERM}

End Web Test
    Close browser