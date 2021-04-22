This is a template for using Chrome-selenium-python-awsLambda combo.

The latest Chrome version (90.0.4430 as of this writing) is somehow not yet supported in AWS lambda. There won't be any error while developing locally, but it just does not work on AWS, even though you have wrapped your environment inside a container. 

Eventually AWS lambda might support the latest version of Chrome, but just not yet. Using older versions of Chrome is the way to go now. See instructions below.

# Deploy to AWS Lambda as a container
1. Go to **AWS Elastic Container Registry (ECS)**, select or create a repository, click "View push commands".
2. Follow the instructions in "View push commands" to push your container to ECS.
    1. `Login`: retrieve an authentication token
    2. `Build`: build your Docker image
    3. `Tag`: tag your image so it can be push to your ECS
        - Note that image name should match your ECS registry. You can edit tags however you want.
    4. `Push`: push your image
3. Go to AWS Lambda and create a new function **from container**.
4. Don't forget to edit **memory** and **timeout** configuration after your lambda function is created.

# Reference
- https://stackoverflow.com/a/66594707
- https://github.com/umihico/docker-selenium-lambda/
