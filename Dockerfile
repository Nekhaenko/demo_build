FROM ubuntu:22.04

# Install R
RUN apt-get update && apt-get install -y wget
RUN apt install -y --no-install-recommends software-properties-common dirmngr

RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt install -y --no-install-recommends r-base

FROM public.ecr.aws/lambda/python:3.11

COPY src/* ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler.
CMD [ "main.handler" ]