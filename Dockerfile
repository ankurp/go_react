FROM golang:1.12.5-stretch

RUN apt-get update
RUN apt-get install -y curl tar xz-utils
RUN curl -sSL "https://nodejs.org/dist/v12.4.0/node-v12.4.0-linux-x64.tar.xz" | tar --strip-components=2 -xJ -C /usr/local/bin/ node-v12.4.0-linux-x64/bin/node
RUN curl https://www.npmjs.com/install.sh | bash
RUN npm install yarn -g

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

RUN wget https://github.com/gobuffalo/buffalo/releases/download/v0.14.6/buffalo_0.14.6_linux_amd64.tar.gz
RUN tar -xvzf buffalo_0.14.6_linux_amd64.tar.gz

RUN ./buffalo build

EXPOSE 3000

CMD ["./bin/go_react"]
