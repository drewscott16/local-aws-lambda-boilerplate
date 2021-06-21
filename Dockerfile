FROM lambci/lambda:build-nodejs12.x
ENV AWS_DEFAULT_REGION us-east-1
COPY . .
RUN npm install