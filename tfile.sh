#!~/bin/sh
HOST=120.26.56.174
USER=root
PW=Max6and7
AUTH_FILE=/Users/chenjinlong/.ssh/alivm_rsa
scp -i $AUTH_FILE ${1} $USER@$HOST:${2:\~/}

