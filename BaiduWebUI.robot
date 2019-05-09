*** Settings ***
Library           Selenium2Library
Library           String
Library           Collections

*** Test Cases ***
BaiduWebUILoginPage
    Open Browser    https://www.baidu.com    Firefox
    Sleep    10
    Close All Browsers

SelectWindowsTest1
    Open Browser    https://www.baidu.com    Firefox
    Maximize Browser Window
    Input Text    kw    Python
    Click Element    su
    Sleep    30
    Wait Until Page Contains    python
    Click Element    xpath = /html/body/div/div[3]/div[1]/div[3]/div[2]/div[1]/h3/a
    Sleep    30
    ${titles}    Get Window Titles
    Log    ${titles}
    ${title2}    Get From List    ${titles}    1
    ${title1}    Get From List    ${titles}    0
    Log    ${title2}
    Log    ${title1}
    Sleep    5
    Select Window    title=${title1}
    Sleep    30
    Close All Browsers

SwitchBrowsersTest1
    ${brow1}    Open Browser    https://www.baidu.com    Firefox    2nd_conn
    Sleep    30
    Maximize Browser Window
    Input Text    kw    Python
    Click Element    su
    Sleep    30
    #Open a new browser
    ${brow2}    Open Browser    http://news.baidu.com/    Firefox
    Sleep    30
    Maximize Browser Window
    #Create a new window handle
    ${service args}=    Create List    --proxy=localhost:8888
    ${brow3}    Create Webdriver    Firefox    service_args = ${service args}
    Go To    https://www.baidu.com/
    Sleep    30
    Input Text    kw    Hello
    Sleep    30
    #Switch browser, switch to the first browser
    Switch Browser    ${brow1}
    Capture Page Screenshot
    Sleep    30
    #Switch browser, switch to the second browser
    Switch Browser    ${brow2}
    Capture Page Screenshot
    Sleep    30
    #Switch browser, switch to the Third browser
    Switch Browser    ${brow3}
    Capture Page Screenshot
    Sleep    30
