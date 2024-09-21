# Base Image
FROM ubuntu:22.04

# 必要なパッケージのインストール
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        locales tzdata sudo zip unzip bzip2 p7zip-full \
        curl wget jq \
        vim git \
        python3 python3-pip \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y

# localesの設定
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# AWSCLIv2
WORKDIR /opt
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip
RUN apt-get install -y groff

# AWS SDK
RUN pip3 install boto3

RUN useradd -u 1000 -g 100 -G sudo -s /bin/bash -d /home/ubuntu ubuntu && \
    echo "ubuntu:ubuntu" | chpasswd

RUN apt install -y nodejs npm
#起動したらもう一度実施
# aws configure --profile localstack
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
# &&  . ~/.nvm/nvm.sh \
# &&  nvm install node
# RUN npm i -g serverless
# RUN npm i -D serverless-localstack
# git clone --filter=blob:none --sparse https://github.com/serverless/examples.git
# git sparse-checkout set aws-python-rest-api-with-dynamodb

# #after_create_project
# npm install serverless-localstack --save-dev 
# # deploy
# # mvn package
# # serverless deploy
# aws configure --profile localstack

USER ubuntu
WORKDIR /home/ubuntu

CMD ["bash"]
