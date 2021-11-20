*** Settings ***
Library       SeleniumLibrary
Test Teardown   Close All Browsers

*** Variables ***
${MAIN_PAGE}                  https://the-internet.herokuapp.com/dynamic_loading
${EXAMPLE1 LINK}              xpath://a[contains(text(),'Example 1: Element on page that is hidden')]
${EXAMPLE2 LINK}              xpath://a[contains(text(),'Example 2: Element rendered after the fact')]
${START}                      //button[contains(text(),'Start')]
${LODING}                     xpath://body/div[2]/div[1]/div[1]/div[1]/img[1]
${HELLO WORLD}                xpath://h4[contains(text(),'Hello World!')]


*** Test Cases ***
Test Example1 Link
    GIVEN I am on Main page
    WHEN I click on Example1 link
    AND I click on start button
    AND the loading symbol should be visible
    THEN Hello World text is visible

Test Example2 Link
    GIVEN I am on Main page
    WHEN I click on Example2 link
    AND I click on start button
    AND the loading symbol should be visible
    THEN Hello World text is visible

*** Keywords ***
I am on Main page
    open browser    ${MAIN PAGE}    chrome
I click on Example1 link
    click link  ${EXAMPLE1 LINK}
WHEN I click on Example2 link
    click link  ${EXAMPLE2 LINK}
I click on start button
    click button    ${START}
the loading symbol should be visible
    wait until element is visible  ${LODING}
    element should be visible  ${LODING}
Hello World text is visible
    wait until element is visible   ${HELLO WORLD}
    element should be visible  ${HELLO WORLD}
    close browser
