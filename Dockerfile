FROM docker.io/library/node:16.5.0
WORKDIR /game
ADD clh-game.tar.gz /game
RUN npm install
RUN npm run extract
EXPOSE 3000
EXPOSE 3001
ENTRYPOINT ["npm", "start"]