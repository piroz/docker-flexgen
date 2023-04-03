FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TRANSFORMERS_CACHE=/cache
ENV HF_DATASETS_CACHE=/cache

WORKDIR /work

RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends \
    python3 \
    python3-pip \
    git \
    curl \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install --upgrade pip && \
    git clone https://github.com/FMInference/FlexGen && \
    cd FlexGen && \
    # git checkout a8c8aa521e14806d07d01190cf095eb3119ae583 -b develop && \
    pip install -e .

COPY chatbot.py /work/FlexGen/flexgen/apps/chatbot.py

ENTRYPOINT ["python3"]
CMD ["/work/FlexGen/flexgen/apps/chatbot.py", "--model", "facebook/opt-6.7b", "--compress-weight"]
