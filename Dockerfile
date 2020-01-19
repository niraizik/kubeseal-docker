FROM ubuntu:18.04
ARG VERSION=v0.9.6

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
&& rm -rf /var/lib/apt/lists/* \
&& pip3 install awscli --upgrade \
&& wget -O /usr/local/bin/kubeseal https://github.com/bitnami-labs/sealed-secrets/releases/download/${VERSION}/kubeseal-linux-amd64 \
&& chmod a+x /usr/local/bin/kubeseal

ENTRYPOINT ["/usr/local/bin/kubeseal"]
