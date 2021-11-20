*** Settings ***
Library       SeleniumLibrary
Test Teardown   Close All Browsers
Library           OperatingSystem

*** Variables ***
${MAIN_PAGE}                https://the-internet.herokuapp.com/jqueryui/menu#
${ENABLED}                   //a[contains(text(),'Enabled')]
${DOWNLOADS}                 //a[contains(text(),'Downloads')]
${PDF}                      //a[contains(text(),'PDF')]
${CSV}                      //a[contains(text(),'CSV')]
${EXCEL}                    //a[contains(text(),'Excel')]


*** Test Cases ***
Test Downloading files

    # create unique folder
    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.plugins_disabled=${disabled}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    go to   ${MAIN_PAGE}
    Click on dowloads
    click link    ${PDF}
    # wait for download to finish
    ${file1}    Wait Until Keyword Succeeds    1 min    2 sec    Download should be done    ${download directory}
    log to console   ${file1}

    Click on dowloads
    click link    ${CSV}
    # wait for download to finish
    ${file2}    Wait Until Keyword Succeeds    1 min    10 sec    Download should be done    ${download directory}
    log to console   ${file2}


    Click on dowloads
    click link    ${Excel}
    # wait for download to finish
    ${file3}    Wait Until Keyword Succeeds    1 min    2 sec    Download should be done    ${download directory}
    log to console   ${file3}
    close browser

*** Keywords ***
Download should be done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}

Click on dowloads
    Click link    ${ENABLED}
    wait until element is visible   ${DOWNLOADS}
    click link    ${DOWNLOADS}
    wait until element is visible    ${PDF}