FROM python:3.7-alpine

RUN apk add --update bash git libffi-dev libffi vim

RUN mkdir -p /app/my-app

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev

COPY . /app/my-app

WORKDIR /app/my-app

RUN /app/my-app && pipenv install --dev

CMD [ "python", "run.py" ]
