# local-aws-lambda-boilerplate
Docker Image for Local AWS Lambda

### Step 1: Build Image
```docker build -t local-aws-lambda-boilerplate .```

### Step 2: Run container
```docker run --rm \
-e DOCKER_LAMBDA_WATCH=1 -e DOCKER_LAMBDA_STAY_OPEN=1 -p 9001:9001 \
--name node-ping \
-v "$PWD":/var/task:ro,delegated \
lambci/lambda:nodejs12.x index.handler
```

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