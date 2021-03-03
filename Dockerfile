FROM registry.access.redhat.com/ubi8/php-72
ADD advanced/ .
RUN TEMPFILE=$(mktemp) && \
    curl -o "$TEMPFILE" "https://getcomposer.org/installer" && \
    php <"$TEMPFILE" && \
    ./composer.phar install --no-interaction --no-ansi --optimize-autoloader
RUN php init --env=Development --overwrite=n
CMD /usr/libexec/s2i/run
