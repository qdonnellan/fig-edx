FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD edx-platform /code/

RUN echo "adding appropriate repos to the system..."
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN add-apt-repository ppa:chris-lea/node.js-libs
RUN add-apt-repository ppa:chris-lea/libjs-underscore

RUN echo "installing appropriate system packages..."
RUN xargs -a requirements/system/ubuntu/apt-packages.txt apt-get -y install

RUN echo "installing required python libaries..."
RUN pip install -r requirements/edx/pre.txt
RUN pip install -r requirements/edx/base.txt
RUN pip install -r requirements/edx/github.txt

RUN echo "main edX setup..."
RUN python setup.py install

RUN echo "installing local python libraries..."
WORKDIR /code/common/lib/calc
RUN python setup.py install
WORKDIR /code/common/lib/capa
RUN python setup.py install
WORKDIR /code/common/lib/chem
RUN python setup.py install
WORKDIR /code/common/lib/sandbox-packages
RUN python setup.py install
WORKDIR /code/common/lib/symmath
RUN python setup.py install
WORKDIR /code/common/lib/xmodule
RUN python setup.py install

WORKDIR /code

RUN echo "installing local (post-install) python libraries..."
RUN pip install -r requirements/edx/post.txt