FROM node

WORKDIR /usr/src/app

RUN npm install -g npm @vue/cli

CMD ["/bin/sh"]
