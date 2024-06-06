FROM hashicorp/terraform:1.5

WORKDIR /app

ENV PATH="${PATH}:/home/zocket/.local/bin"
ENV LOCALSTACK_HOSTNAME="localstack"
ENV AWS_ACCESS_KEY_ID="test"
ENV AWS_SECRET_ACCESS_KEY="test"
ENV AWS_DEFAULT_REGION="ap-southeast-1"

RUN apk add python3 py3-pip make curl jq \
    && adduser -D -u 1000 zocket

USER zocket

RUN pip3 install --user terraform-local awscli

COPY config/.aws /home/zocket/.aws

