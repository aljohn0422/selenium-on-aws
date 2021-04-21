FROM public.ecr.aws/lambda/python:3.8 as build
RUN yum install -y unzip && \
    curl -SL https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip > chromedriver.zip && \
    curl -SL https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-37/stable-headless-chromium-amazonlinux-2017-03.zip > headless-chromium.zip && \
    unzip chromedriver.zip -d /bin/ && \
    unzip headless-chromium.zip -d /bin/

FROM public.ecr.aws/lambda/python:3.8
COPY build/google-chrome.repo /etc/yum.repos.d/
RUN yum install -y --enablerepo=google-chrome google-chrome-stable
COPY --from=build /bin/headless-chromium /bin/
COPY --from=build /bin/chromedriver /bin/

COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .

CMD [ "app.handler" ]
