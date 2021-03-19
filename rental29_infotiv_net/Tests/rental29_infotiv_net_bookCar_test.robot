*** Settings ***

Documentation                       Testsvit - "Boka en bil"
Resource                            ../Resources/rental29_bookCar.robot
Library                             SeleniumLibrary
Test Setup                         Begin Web Test
Test Teardown                      End Web Test

*** Variables ***
${BROWSER}          chrome
${URL1}             http://rental29.infotiv.net/

*** Test Cases ***
User can login and navigate to booking a car.
    [Tags]  VG_test
    Given USER accesses the webpage
    And USER is logged in
    And USER navigates to finding car bookings
    And USER clicks on requested car to book
    And USER inputs requirement information for booking the car
    When USER confirms booking
    Then the USER will successfully book a car and add booking to 'mypage'

    #Normal test case to check all functionalities regarding booking a car succesfully (without Gherkin-Syntax)
    #Go to Web Page
    #Input Username                                       stefan_nikolic@hotmail.com
    #Input Password                                       123456
    #Verify User Logged in
    #Access Car Selection Page
    #Book Audi Q7
    #Input Booking CardNumber                             1234567890123456
    #Input Booking FullName AND Dropdown                  Stefan Nikolic
    #Input Booking Cvc                                    137
    #Confirm Booking
    #Verify Confirm Page
    #Verify Mypage Loaded