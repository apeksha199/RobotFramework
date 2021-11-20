*** Settings ***
Library       SeleniumLibrary
Test Teardown   Close All Browsers

*** Variables ***
${MAIN_PAGE}                 https://the-internet.herokuapp.com/tables
${TABLE1}                    //table[@id='table1']
${LAST NAME}                 //table[@id='table1']//span[contains(text(),'Last Name')]
${FIRST NAME}                //table[@id='table1']//span[contains(text(),'First Name')]
${EMAIL}                     //table[@id='table1']//span[contains(text(),'Email')]
${DUE}                       //table[@id='table1']//span[contains(text(),'Due')]
${WEBSITE}                   //table[@id='table1']//span[contains(text(),'Web Site')]


*** Test Cases ***
Test Sorting of table elements
    GIVEN I am on Main page
    WHEN I click on last name table
    THEN Last name table should be arranged in ascending order
    WHEN I click on last name table
    THEN Last name table should be arranged in descending order
    WHEN I click on First name table
    THEN First name table should be arranged in ascending order
    WHEN I click on First name table
    THEN First name table should be arranged in descending order
    WHEN I click on Email table
    THEN Email table should be arranged in ascending order
    WHEN I click on Email table
    THEN Email table should be arranged in descending order
    WHEN I click on Due table
    THEN Due table should be arranged in ascending order
    WHEN I click on Due table
    THEN Due table should be arranged in descending order
    WHEN I click on Website table
    THEN Website table should be arranged in ascending order
    WHEN I click on Website table
    THEN Website table should be arranged in descending order

*** Keywords ***
I am on Main page
    open browser   ${MAIN_PAGE}   chrome

I click on last name table
    wait until element is visible   ${LAST NAME}
    click element   ${LAST NAME}
Last name table should be arranged in ascending order
    table cell should contain    ${TABLE1}   2  1   Bach
    table cell should contain    ${TABLE1}   2  3   fbach@yahoo.com
    table cell should contain    ${TABLE1}   2  4   $51.00
Last name table should be arranged in descending order
    table cell should contain    ${TABLE1}   2  1   Smith
    table cell should contain    ${TABLE1}   2  3   jsmith@gmail.com
    table cell should contain    ${TABLE1}   2  4   $50.00

I click on First name table
    click element   ${FIRST NAME}
First name table should be arranged in ascending order
    table cell should contain    ${TABLE1}   2  2   Frank
    table cell should contain    ${TABLE1}   2  5   http://www.frank.com
    table cell should contain    ${TABLE1}   2  1   Bach
First name table should be arranged in descending order
    table cell should contain    ${TABLE1}   2  2   Tim
    table cell should contain    ${TABLE1}   2  5   http://www.timconway.com
    table cell should contain    ${TABLE1}   2  1   Conway

I click on Email table
    click element   ${EMAIL}
Email table should be arranged in ascending order
    table cell should contain    ${TABLE1}   2  3   fbach@yahoo.com
    table cell should contain    ${TABLE1}   2  4   $51.00
    table cell should contain    ${TABLE1}   2  1   Bach
Email table should be arranged in descending order
    table cell should contain    ${TABLE1}   2  3   tconway@earthlink.net
    table cell should contain    ${TABLE1}   2  4   $50.00
    table cell should contain    ${TABLE1}   2  1   Conway

I click on Due table
    click element   ${DUE}
Due table should be arranged in ascending order
    table cell should contain    ${TABLE1}   2  3   jsmith@gmail.com
    table cell should contain    ${TABLE1}   2  4   $50.00
    table cell should contain    ${TABLE1}   2  1   Smith
Due table should be arranged in descending order
    table cell should contain    ${TABLE1}   2  3   jdoe@hotmail.com
    table cell should contain    ${TABLE1}   2  4   $100.00
    table cell should contain    ${TABLE1}   2  1   Doe

I click on Website table
    click element   ${WEBSITE}
Website table should be arranged in ascending order
    table cell should contain    ${TABLE1}   2  5   http://www.frank.com
    table cell should contain    ${TABLE1}   2  1   Bach
    table cell should contain    ${TABLE1}   2  2   Frank
Website table should be arranged in descending order
    table cell should contain    ${TABLE1}   2  5   http://www.timconway.com
    table cell should contain    ${TABLE1}   2  1   Conway
    table cell should contain    ${TABLE1}   2  2   Tim
    close browser
