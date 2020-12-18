*** Settings ***
Library           AppiumLibrary
Resource          公共元素.robot
Resource          配置文件.robot

*** Keywords ***
点击按钮
    [Arguments]    ${button}
    WaitUntilPageContainsElement    ${button}    ${wait_time}    定位元素超时
    Click Button    ${button}

点击元素
    [Arguments]    ${path}
    WaitUntilPageContainsElement    ${path}    ${wait_time}    定位元素超时
    Click Element    ${path}

输入文本
    [Arguments]    ${locator}    ${text}
    WaitUntilPageContainsElement    ${locator}    ${wait_time}    定位元素超时
    Input Text    ${locator}    ${text}

元素文本应该是
    [Arguments]    ${locator}    ${expected}    ${msg}=
    WaitUntilPageContainsElement    ${locator}    ${wait_time}    定位元素超时
    Element Text Should Be    ${locator}    ${expected}    ${msg}

获取元素文本
    [Arguments]    ${locator}
    WaitUntilPageContainsElement    ${locator}    ${wait_time}    定位元素超时
    ${text}    Get Text    ${locator}
    [Return]    ${text}

元素应该不可用
    [Arguments]    ${locator}
    WaitUntilPageContainsElement    ${locator}    ${wait_time}    定位元素超时
    Element Should Be Disabled    ${locator}
