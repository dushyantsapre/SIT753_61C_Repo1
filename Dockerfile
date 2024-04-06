FROM node:20.5.0-alpine
WORKDIR app
COPY . .
RUN npm install -g npm@latest
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
