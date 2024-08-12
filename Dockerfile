FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN apt-get update && apt-get install -y curl gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN apt-get update && apt-get install -y \
    git curl python3-pip python3-venv ffmpeg
COPY requirements.txt /requirements.txt
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && pip install -r requirements.txt
RUN mkdir /MusicPlayer
WORKDIR /MusicPlayer
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
