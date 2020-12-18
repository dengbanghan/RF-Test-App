*** Variables ***
&{app}            remoteUrl=http://127.0.0.1:4723/wd/hub    deviceName=192.168.5.102:5555    platformName=Android    appPackage=io.newtype.eddid.app    appActivity=com.eddid.home.ui.activity.LauncherActivity
${wait_time}      10
&{mysql}          mysql_host=rm-wz94r73is5gxn6it59o.mysql.rds.aliyuncs.com    mysql_port=3306    mysql_user=eddid_dev    mysql_pwd=eddid@123    mysql_db=message_push_qa
