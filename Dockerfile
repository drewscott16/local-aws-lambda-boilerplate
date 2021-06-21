FROM lambci/lambda:build-nodejs12.x
ENV AWS_DEFAULT_REGION us-west-2
COPY . .
RUN npm install