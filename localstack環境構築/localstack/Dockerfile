FROM localstack/localstack
RUN apt-get update && apt-get install -y curl build-essential docker.io

ENV NVM_DIR=/root/.nvm
ENV NODE_VERSION=20.18.0

RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm use $NODE_VERSION && \
    nvm alias default $NODE_VERSION

RUN . $NVM_DIR/nvm.sh && npm install -g serverless@3
RUN . $NVM_DIR/nvm.sh && npm install -D serverless-localstack

WORKDIR /opt/sls/aws-python-rest-api-with-dynamodb




# RUN apt-get update && apt install -y nodejs npm docker.io

# ENV NVM_DIR="~/.nvm"
# ENV NODE_VERSION="20.18.0"

# RUN mkdir -p $NVM_DIR && \
#     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
#     echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
#     echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc && \
#     echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc && \
#     . ~/.bashrc && nvm install $NODE_VERSION && nvm use $NODE_VERSION && nvm alias default $NODE_VERSION

# RUN bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION"
# RUN bash -c "source $NVM_DIR/nvm.sh && npm i -g serverless@3"
# RUN bash -c "source $NVM_DIR/nvm.sh && npm i -D serverless-localstack"

# WORKDIR /opt/sls/aws-python-rest-api-with-dynamodb

