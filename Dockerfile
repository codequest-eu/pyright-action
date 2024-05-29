FROM python:3.11-slim

RUN apt-get update && apt-get install --no-install-recommends --yes \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

RUN npm install --global pyright

RUN useradd --shell "/usr/bin/bash" --create-home demo
RUN mkdir -p /opt/demo && chown demo:demo /opt/demo
WORKDIR /opt/demo
USER demo

COPY ./demo.py ./pyproject.toml ./
