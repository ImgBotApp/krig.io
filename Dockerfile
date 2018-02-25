FROM jitesoft/node-yarn:latest as build
COPY . /app
RUN yarn install && gulp build

FROM jitesoft/lighttpd
COPY --from=build /app/app /var/www/html
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]