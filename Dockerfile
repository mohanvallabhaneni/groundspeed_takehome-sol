FROM python:3.6

RUN apt-get update

WORKDIR /app

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt --src /usr/local/src

ADD . /app
EXPOSE 80

CMD DATABASE_URL="postgresql://$USER_DB:$PASS_DB@$HOST_DB:$PORT_DB/postgres" python app.py