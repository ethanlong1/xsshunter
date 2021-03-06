FROM ubuntu:16.04

RUN apt-get update && \
apt-get install --no-install-recommends -y \
git \
nginx \
postgresql \
postgresql-contrib \
python2.7 \
python-pip \
sudo \
python-virtualenv \
python-dev \
libpq-dev \
libffi-dev \
build-essential \
virtualenv

RUN pip install setuptools

RUN pip install pyyaml


RUN git clone https://github.com/ethanlong1/xsshunter.git

RUN pip install --upgrade pip

RUN mkdir /etc/nginx/shared-configs
RUN cp /xsshunter/shared-configs/ssl.conf /etc/nginx/shared-configs/

CMD ["/bin/bash","/xsshunter/entrypoint.sh"]
