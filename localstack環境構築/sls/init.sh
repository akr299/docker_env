cd /opt/sls/aws-python-rest-api-with-dynamodb
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node
npm i -g serverless
npm i -D serverless-localstack
apt install docker.io