FROM nvidia/cuda:8.0-runtime-ubuntu16.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDNN_VERSION 6.0.21
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn6=$CUDNN_VERSION-1+cuda8.0 && \
    rm -rf /var/lib/apt/lists/*

RUN  apt-get update \
  && apt-get upgrade
  && apt-get install -y wget \


RUN wget http://www.cs.cornell.edu/~cristian/data/cornell_movie_dialogs_corpus.zip
COPY / /
RUN apt-get install unzip
RUN mkdir assignments/chatbot/data
RUN unzip cornell_movie_dialogs_corpus.zip -d assignments/chatbot/data/.