*** Settings ***
Library           AppiumLibrary
Resource          配置文件.robot

*** Keywords ***
打开App
    Open Application    &{app}[remoteUrl]    platformName=&{app}[platformName]    deviceName=&{app}[deviceName]    appPackage=&{app}[appPackage]    appActivity=&{app}[appActivity]    skipServerInstallation=True    noReset=True
