#!/usr/bin/expect
spawn ssh root@localhost
expect "*assword:*"
send "max6and7"
expect eof
