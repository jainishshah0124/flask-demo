FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install python3-pip -y
RUN apt-get install gunicorn3 -y

COPY ./demoapp/requirements.txt requirements.txt
COPY ./demoapp /opt/

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
WORKDIR /opt/

CMD [ "gunicorn3","-b","0.0.0.0:8000","app:app","--workers=5" ]