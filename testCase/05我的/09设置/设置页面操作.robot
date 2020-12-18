*** Settings ***
Resource          设置页面元素.robot
Resource          ../我的页面操作.robot
Resource          ../../公共元素.robot

*** Keywords ***
登出艾德账号
    进入设置页面
    点击元素    ${setting_logout}
    点击元素    ${pop_up_confirm}
