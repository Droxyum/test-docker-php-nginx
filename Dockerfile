FROM webdevops/php-nginx:7.3

WORKDIR /app
ENV WEB_DOCUMENT_ROOT="/app/public"

COPY ./ /app

RUN wget https://getcomposer.org/download/2.1.5/composer.phar
RUN php -d memory_limit=-1 composer.phar update
RUN php -d memory_limit=-1 composer.phar install

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# RUN npm install
