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
RUN add-apt-repository ppa:webupd8team/java

# インストール
RUN apt-get update && apt-get upgrade -y gradle git maven ant

# OracleJDKのインストール
# RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
# RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
# RUN apt-get install -y oracle-java8-installer

# OpenJDKのインストール && 1.8.0の切り替え
RUN apt-get install -y openjdk-8-jdk
RUN update-java-alternatives --set java-1.8.0-openjdk-amd64

# Graldeのダウングレード
RUN apt-get install -y gradle-4.10.3
RUN update-alternatives --set gradle /usr/lib/gradle/4.10.3/bin/gradle
