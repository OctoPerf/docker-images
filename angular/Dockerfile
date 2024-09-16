FROM node:20

RUN apt update -y \
  && apt upgrade -y  \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb  \
  && apt-get install -y ./google-chrome-stable_current_amd64.deb  \
  && rm -f google-chrome-stable_current_amd64.deb  \
  &&   apt update -y

