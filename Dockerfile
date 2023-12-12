FROM ubuntu:latest
MAINTAINER Tim Potter "tim@timpotter.name"
RUN apt-get update -y
RUN apt-get install -y python-pip python2.7-dev build-essential
COPY . /app
WORKDIR /app
RUN pip2 install -r requirements.txt
ENTRYPOINT ["python2"]
CMD ["main.py"]
