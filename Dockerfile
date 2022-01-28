# FROM nginx:stable
# COPY default.conf /etc/nginx/conf.d/default.conf
# COPY index.html /usr/share/nginx/html/index.html
# COPY ec2.py ec2.py
# ## Install Python
# RUN apt update -y && apt install software-properties-common -y
# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt update -y
# RUN apt install python3.8 -y
# RUN pip3 install boto3 
## Install awscli
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# RUN apt update -y && apt-get install jq -y && apt install unzip -y
# RUN unzip awscliv2.zip
# RUN ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
## Execute the script
# COPY script.sh script.sh
# RUN chmod a+x script.sh
# ENTRYPOINT ["./script.sh"]



# FROM python:3.8-alpine3.14
# RUN apk update && apk add nginx openrc
# RUN pip3 install boto3
# # COPY default.conf /etc/nginx/conf.d/default.conf
# # COPY index.html /usr/share/nginx/html/index.html
# COPY ec2.py ec2.py
# # COPY script.sh script.sh
# # RUN chmod a+x script.sh
# # ENTRYPOINT ["./script.sh"]
# ENTRYPOINT ["sleep", "5000"]

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





