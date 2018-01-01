# Example file

FROM ubuntu:16.04

MAINTAINER Hoanh An "hoanhan@bennington.edu"

RUN apt-get update; apt-get install -y nginx

RUN echo 'Hi, I am in your container' \ 
	>/var/www/html/index.html

EXPOSE 80