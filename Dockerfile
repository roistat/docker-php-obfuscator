FROM composer/composer

WORKDIR /root

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y unzip

RUN wget https://github.com/roistat/php-obfuscator/archive/master.zip \
    && unzip master.zip \
    && rm master.zip

RUN cd /root/php-obfuscator-master && composer install

RUN ln -s /root/php-obfuscator-master/bin/obfuscate /bin/obfuscate

ENTRYPOINT ["/bin/obfuscate"]
