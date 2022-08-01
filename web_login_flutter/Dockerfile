FROM cirrusci/flutter:3.0.5 AS builder
WORKDIR /front
RUN flutter doctor
RUN flutter config --enable-web
COPY . /front
RUN flutter pub get
RUN flutter build web

FROM nginx:1.17.6-alpine
RUN rm -r /usr/share/nginx/html/
COPY --from="builder" /front/build/web/ /usr/share/nginx/html/
CMD ["/bin/sh",  "-c",  "exec nginx -g 'daemon off;'"]