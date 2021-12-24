FROM ubuntu

RUN apt-get update
RUN apt-get -y install python

RUN apt-get -y install pip

RUN pip install flask
RUN pip install flask-mysql

COPY . /opt/source-code
WORKDIR /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run
