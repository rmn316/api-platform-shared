FROM nginx:alpine
MAINTAINER Robert Neal <rmn316@gmail.com>

RUN rm /etc/nginx/conf.d/default.conf
ADD conf/www.conf /etc/nginx/conf.d/www.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]