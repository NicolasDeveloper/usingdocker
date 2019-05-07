FROM python:3.7

ENV FLASK_APP /app/identidock.py
ENV FLASK_ENV "development"
ENV FLASK_DEBUG 1

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

RUN pip install --upgrade pip
RUN pip install uwsgi

RUN pip install Flask==0.10.1 Werkzeug==0.14.1 requests==2.5.1 redis==2.10.3 

WORKDIR /app
COPY app /app
COPY cmd.sh / 

EXPOSE 9090 9191
USER uwsgi

CMD ["sh","/cmd.sh"]