FROM ubuntu:latest
RUN apt-get update -y && apt-get upgrade -y && apt-get install inotify-tools gzip -y
WORKDIR /app
RUN mkdir /app/incoming && mkdir /app/processed
ADD sprocess.sh .
CMD ./process.sh
