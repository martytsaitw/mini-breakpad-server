FROM node:6

# Install dependencies for mini-breakpad-server
USER root
RUN apt-get -y install git python build-essential
USER node

# Install mini-breakpad-server
RUN bash -l -c "git clone https://github.com/superhuman/mini-breakpad-server.git"
WORKDIR /home/node/mini-breakpad-server
RUN bash -l -c "yarn install"

# mini-breakpad-server listens on port 1127
EXPOSE 1127
EXPOSE 3000

CMD bash -l -c "node lib/app.js"
