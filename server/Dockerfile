FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y openjdk-11-jre curl

ADD /target/server-1.0-SNAPSHOT-jar-with-dependencies.jar /srv/apiserver.jar
ADD QuoteDataBaseSQL.db /srv/QuoteDataBaseSQL.db

WORKDIR /srv
EXPOSE 5000

CMD ["java","-jar","apiserver.jar"]