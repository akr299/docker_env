# server/Dockerfile
FROM node:20

WORKDIR /usr/src/app

# Serverlessをグローバルにインストール v4だと何をやってもログインできないのでとりま3に
# RUN npm install -g serverless@3
RUN npm install -g serverless@4

# package.json と package-lock.json をコピーして依存関係をインストール
COPY package*.json ./
RUN npm install

# 残りのアプリケーションファイルをコピー
COPY . .

EXPOSE 3000
CMD ["serverless", "offline", "--host", "0.0.0.0"]
