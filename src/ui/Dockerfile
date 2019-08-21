FROM ubuntu:16.04

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . $APP_HOME


RUN apt-get update -qq && apt-get install --no-install-recommends -y build-essential ruby-full ruby-dev \
    && gem install bundler --no-ri --no-rdoc \
    && bundle install \
    && bundle clean --force \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

ENV POST_SERVICE_HOST post 
ENV POST_SERVICE_PORT 5000 
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
