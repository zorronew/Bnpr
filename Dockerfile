FROM php:8.2-cli

RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY . .

CMD php -S 0.0.0.0:$PORT
