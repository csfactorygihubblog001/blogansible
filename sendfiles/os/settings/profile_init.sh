#!/bin/bash

#ホスト名を登録
admin=adminserv01
db=dbserv01
ap=apserv01

host=$HOST



#HISTORYを各端末で個別に作らない。
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999




#すべての共通
alias vi='vim'


#APサーバが存在する
if [ "$host" = "$ap" -o "$host" = "$admin" ]; then
  export JAVA_HOME=/usr/java/default
  export CATALINA_HOME=/opt/tomcat
  export CATALINA_BASE=/opt/tomcat
  export PATH=${JAVA_HOME}/bin:${CATALINA_HOME}/bin:${PATH}
fi

if [ "$host" = "$admin" ]; then
  export MAVEN_HOME=/opt/maven
  export PATH=${MAVEN_HOME}/bin:${PATH}
fi


#RVENV実行
#export RBENV_HOME=~/.rbenv
#export PATH=${RBENV_HOME}/bin:${PATH}
#eval "$(rbenv init -)" >/dev/null 2>&1
if [ $USER = "root" ]; then
export RBENV_HOME=/root/.rbenv
export PATH=${RBENV_HOME}/bin:${PATH}
#REPLACE_EXECRBENV

fi
