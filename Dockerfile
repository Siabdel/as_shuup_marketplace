#FROM node:12.21.0-buster-slim as base
FROM python:3.8.3-slim

# This image is NOT made for production use.
LABEL maintainer="Eero Ruohola <eero.ruohola@shuup.com>"

RUN apt-get update \
    && apt-get --assume-yes install \
        libpangocairo-1.0-0 \
        python3 \
        python3-dev \
        python3-pil \
        python3-pip \
    && rm -rf /var/lib/apt/lists/ /var/cache/apt/

# These invalidate the cache every single time but
# there really isn't any other obvious way to do this.
COPY . /app
COPY ./entrypoint.sh /app
WORKDIR /app

# The dev compose file sets this to 1 to support development and editing the source code.
# The default value of 0 just installs the demo for running.
ARG editable=1

RUN pip install -U pip
RUN pip install -U setuptools
# install requirements
RUN if [ "$editable" -eq 1 ]; then pip3 install -r requirements.txt ; fi
##&& python3 setup.py build_resources; else pip3 install shuup; fi

# migrate models
#RUN python manage.py migrate
# init data fixtures 
#RUN python manage.py shuup_init