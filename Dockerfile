FROM python:3.7-alpine
LABEL Maintainer "ymmmtym"
ENV HOSTNAME="music-container" \
    APP_PATH="/root/misic-utils" \
    PS1="[\u@\h \W]# "

COPY [".", "$APP_PATH"]
WORKDIR $APP_PATH
RUN apk update && \
    apk add gcc g++ libc-dev libxml2-dev libxslt-dev bash && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r ${APP_PATH}/requirements.txt