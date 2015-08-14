#/bin
HOST=120.26.56.174
USER=root
PW=fuckqq@123
AUTH_FILE=/Users/chenjinlong/.ssh/id_rsa
scp -i $AUTH_FILE ${1} $USER@$HOST:${2:\~/}

