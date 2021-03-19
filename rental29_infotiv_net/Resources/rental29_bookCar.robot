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

USER accesses the webpage
    Go to Web Page

Input Username
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:email                ${SEARCH_TERM}

Input Password
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:password             ${SEARCH_TERM}

Verify User Logged in
    Click Element                       id:login
    Wait Until Page Contains Element    id:welcomePhrase
    Page Should Contain                 You are signed in as Stefan

USER is logged in
    Input Username                      stefan_nikolic@hotmail.com
    Input Password                      123456
    Verify User Logged in

Access Car Selection Page
    Click Element                       id:continue
    Wait Until Page Contains Element    id:questionText
    Page Should Contain                 What would you like to drive?

USER navigates to finding car bookings
    Access Car Selection Page

Book Audi Q7
    Click Element                       id:bookQ7pass7
    Wait Until Page Contains Element    id:questionText
    Page Should Contain                 Confirm booking of Audi Q7

USER clicks on requested car to book
    Book audi q7

Input Booking CardNumber
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:cardNum     ${SEARCH_TERM}

Input Booking FullName AND Dropdown
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:fullName   ${SEARCH_TERM}
    Select From List by Index           xpath://*[@id="confirmSelection"]/form/select[1]    4           #Day 5
    Select From List by Index           xpath://*[@id="confirmSelection"]/form/select[2]    2           #Year 2020

Input Booking Cvc
    [Arguments]                         ${SEARCH_TERM}
    Input Text                          id:cvc        ${SEARCH_TERM}

USER inputs requirement information for booking the car
    Input Booking CardNumber                1234567890123456
    Input Booking FullName AND Dropdown     Stefan Nikolic
    Input Booking Cvc                       137

Confirm Booking
    Click Element                       id:confirm

USER confirms booking
    Confirm Booking

Verify Confirm Page
    Wait Until Page Contains Element    id:questionTextSmall
    Page Should Contain                 A Audi Q7 is now ready for pickup 2021-03-19

Verify Mypage Loaded
    Click Element                       id:mypage
    ${LINK_TEXT}                        Get Title
    Should Be Equal                     ${LINK_TEXT}      Mypage

the USER will successfully book a car and add booking to 'mypage'
    Verify Confirm Page
    Verify Mypage Loaded

End Web Test
    Close browser
