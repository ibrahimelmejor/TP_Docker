#Download base image ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER Ibrahim EL MARZGIOUI
WORKDIR TPDockerSampleApp
# Installation des packeges et compiler
RUN apt update && apt install -y openjdk-8-jdk && apt install -y maven && apt install -f libpng16-16 && apt install -y -f libjasper1 && apt install -y -f libdc1394-22 && apt install -y git && git clone https://github.com/barais/TPDockerSampleApp . && apt clean 
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar && mvn package 
# Lancer l'application
CMD ["java", "-Djava.library.path=lib/", "-jar", "target/fatjar-0.0.1-SNAPSHOT.jar"]