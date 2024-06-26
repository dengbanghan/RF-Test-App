*** Settings ***
Resource          ../登录操作.robot
Resource          ../../09设置/设置页面操作.robot

*** Test Cases ***
登录成功
    验证码登录    17722527464
    校验欢迎词    小艾同学
    [Teardown]    登出艾德账号

验证码错误
    验证码登录    17722527464    1234
    校验弹窗提示内容    短信验证码错误

输入验证码超过6位
    验证码登录    17722527464    1234567

不输入验证码点击登录
    验证码登录    17722527464
    登录按钮应该不可用
