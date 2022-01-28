FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive 
RUN apt update -y && apt install nginx -y
RUN apt install python -y && apt install pip -y
RUN pip install boto3
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY ec2.py ec2.py
COPY script.sh script.sh
RUN chmod a+x script.sh
ENTRYPOINT ["./script.sh"]





