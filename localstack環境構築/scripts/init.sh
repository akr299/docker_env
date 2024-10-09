#!/bin/bash
awslocal s3 mb s3://test-bucket
cd /home/localstack/data/
awslocal s3 cp sample.txt s3://test-bucket/
awslocal s3 ls s3://test-bucket
apt update
apt -y install maven
# npm i -g serverless
# npm i -D serverless-localstack
# #after_create_project
# aws configure --profile localstack
# npm install serverless-localstack --save-dev 
# # cd /opt/sls/aws-python-rest-api-with-dynamodb
# # deploy
# # mvn package
# # serverless login
# # serverless deploy