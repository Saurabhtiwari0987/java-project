FROM ubuntu
RUN  apt-get update && apt-get install curl && apt-get install apache2
CMD ["apachectl", "-D", "FOREGROUND"]
