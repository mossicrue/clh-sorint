FROM node:22.14.0

WORKDIR /app
COPY package.json ./
RUN mkdir /app/leaderboard
RUN npm install
COPY . .
EXPOSE 3002
CMD ["npm", "start"]