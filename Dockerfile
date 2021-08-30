FROM node:16
WORKDIR /one2onetool
COPY package.json /one2onetool
RUN npm install
RUN npm test
COPY . /one2onetool
EXPOSE 3000
CMD [ "node", "index.js" ]
