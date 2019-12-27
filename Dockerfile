FROM ubuntu:latest

# base update
RUN apt-get update && apt-get upgrade -y

# add-apt-repository コマンドの追加
RUN apt-get install -y apt-file
RUN apt-file update
RUN apt-file search add-apt-repository
RUN apt-get install -y software-properties-common

# gradle & java 追加
RUN add-apt-repository ppa:cwchien/gradle

# インストール
RUN apt-get update && apt-get upgrade -y gradle git maven ant

# OpenJDKのインストール
RUN apt-get install -y openjdk-11-jdk
