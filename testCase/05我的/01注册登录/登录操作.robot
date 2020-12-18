*** Settings ***
Resource          ../../常用操作.robot
Resource          登录页面元素.robot
Resource          ../我的页面元素.robot
Library           ../../../Library/RFCommonLibrary/
Library           String
Resource          ../我的页面操作.robot

*** Keywords ***
选择区号
    [Arguments]    ${area_code}

输入手机号
    [Arguments]    ${phone_num}
    输入文本    ${first_input_box}    ${phone_num}

输入验证码
    [Arguments]    ${sms_code}
    输入文本    ${second_input_box}    ${sms_code}

输入密码
    [Arguments]    ${phone_passwd}
    输入文本    ${second_input_box}    ${phone_passwd}

点击获取验证码
    点击元素    ${get_sms_code}

获取验证码
    [Arguments]    ${phone_num}
    ${mysql_host}    Set Variable    &{mysql}[mysql_host]
    ${mysql_port}    Set Variable    &{mysql}[mysql_port]
    ${mysql_user}    Set Variable    &{mysql}[mysql_user]
    ${mysql_pwd}    Set Variable    &{mysql}[mysql_pwd]
    ${mysql_db}    Set Variable    &{mysql}[mysql_db]
    loadDBConfig    ${mysql_host}    ${mysql_port}    ${mysql_user}    ${mysql_pwd}    ${mysql_db}
    ${result}    getSQL    SELECT metadata FROM message_push_qa.push_message WHERE receiver LIKE '%${phone_num}%' ORDER BY last_modified_date DESC LIMIT 1;
    ${metadata}    searchDicKV    ${result}    metadata
    ${metadata_dict}    Json Loads    ${metadata}
    ${templateParam}    searchDicKV    ${metadata_dict}    templateParam
    ${sms_code}    searchDicKV    ${templateParam}    sms_auth_code
    [Return]    ${sms_code}

点击登录按钮
    点击元素    ${login_button}

跳转到密码登录页面

密码明密文切换

跳转到重置密码页面

验证码登录
    [Arguments]    ${phone_num}    ${sms_code}=
    输入手机号    ${phone_num}
    点击获取验证码
    Sleep    0.5
    ${length}    Get Length    ${sms_code}
    ${sms_code}    Run Keyword If    ${length}==0    获取验证码    ${phone_num}
    ...    ELSE    Set Variable    ${sms_code}
    输入验证码    ${sms_code}
    点击登录按钮

密码登录
    [Arguments]    ${phone_num}    ${phone_passwd}
    输入手机号    ${phone_num}
    输入密码    ${phone_passwd}
    点击登录按钮

校验欢迎词
    [Arguments]    ${text}
    元素文本应该是    ${user_welcome}    ${text}

校验弹窗提示内容
    [Arguments]    ${content}
    元素文本应该是    ${pop_up_content}    ${content}

登录按钮应该不可用
    元素应该不可用    ${login_button}
