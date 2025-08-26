FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

# install nodemon globally so it’s available inside container
RUN npm install -g nodemon

COPY . .

EXPOSE 3000

# CMD ["nodemon", "server.js"]
CMD ["npm", "run", "dev"]

