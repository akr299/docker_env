FROM localstack/localstack
RUN apt-get update && apt install -y nodejs npm docker.io
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
 && . ~/.nvm/nvm.sh \
 && nvm install node
WORKDIR /opt/sls/aws-python-rest-api-with-dynamodb
RUN npm i -g serverless@3
RUN npm i -D serverless-localstack