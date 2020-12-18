*** Settings ***
Resource          ../常用操作.robot
Resource          ../公共元素.robot
Resource          我的页面元素.robot

*** Keywords ***
进入验证码登录页面
    点击元素    ${me}
    点击元素    ${user_welcome}

进入设置页面
    点击元素    ${me}
    点击元素    ${me_setting}
