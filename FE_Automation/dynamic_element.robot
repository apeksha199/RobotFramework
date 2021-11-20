*** Settings ***
Library       SeleniumLibrary
Test Teardown   Close All Browsers

*** Variables ***
${MAIN_PAGE}                    https://the-internet.herokuapp.com/challenging_dom
${BUTTON1}                      //a[@class='button']
${BUTTON2}                      //a[@class='button alert']
${BUTTON3}                      //a[@class='button success']
${ANSWER BOX}                   //canvas[@id='canvas']


*** Test Cases ***
Test Dynamic Element
    GIVEN I am on main page
    WHEN I click on buttton 1
    AND I click on button 2
    AND I click on button 3
    THEN the answer box should be visible

*** Keywords ***
I am on main page
    open browser   ${MAIN_PAGE}   chrome
I click on buttton 1
    click link    ${BUTTON1}
I click on button 2
    click link    ${BUTTON2}
I click on button 3
    click link    ${BUTTON3}
the answer box should be visible
    element should be visible   ${ANSWER BOX}
    close browser