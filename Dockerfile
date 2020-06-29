FROM ubuntu:20.04

RUN apt-get -y update && \
    apt-get -y install \
	build-essential \
	python3-dev \
	python3-venv \
	python3-pip

WORKDIR /app

RUN mkdir OpenSlides && cd OpenSlides

ENV VIRTUAL_ENV=.virtualenv

RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade setuptools pip

RUN pip install openslides

EXPOSE 8000

CMD ["openslides"]
