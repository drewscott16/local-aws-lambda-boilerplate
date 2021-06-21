# local-aws-lambda-boilerplate
Docker Image for Local AWS Lambda

### Docker-lambda docs
[Docker-lambda](https://github.com/lambci/docker-lambda "Github link to docker-lambda")

### Step 1: Build Image
```docker build -t local-aws-lambda-boilerplate .```

### Step 2: Run container
```docker run --rm \
-e DOCKER_LAMBDA_WATCH=1 -e DOCKER_LAMBDA_STAY_OPEN=1 -p 9001:9001 \
--name node-ping \
-v "$PWD":/var/task:ro,delegated \
lambci/lambda:nodejs12.x index.handler
```
### OR
```docker run --rm -v "$PWD":/var/task lambci/lambda:nodejs12.x index.handler```

### Step 3: Run Lambda
```curl -XPOST "http://localhost:9001/2015-03-31/functions/function/invocations" -d '{}'```

### Step 3: Run Lambda and output to file in local directory
```aws lambda invoke \
--region us-west-2 \
--endpoint http://localhost:9001 \
--no-sign-request \
--function-name function \
--cli-binary-format raw-in-base64-out \
--payload '{"a":"b"}' output.txt
```

### Step 4: Deploy Lambda to production


### Things I learned
* amazon/aws-lambda-nodejs:12 and lambci/lambda:build-nodejs12.x are both docker images that are very similar but the latter allows you watch for changes and refresh your handler
* Instead of using a build file you could run it once with ```docker run --rm -v "$PWD":/var/task lambci/lambda:nodejs12.x index.handler```
* You need to run it on port 9001, if you want to change the port then look at the docs, this got me