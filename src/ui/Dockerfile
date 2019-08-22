FROM alpine:3.6

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . $APP_HOME


RUN apk update -qq && apk add --no-cache --virtual build-dependencies build-base ruby ruby-dev ruby-json \
    && gem install bundler --no-ri --no-rdoc \
    && bundle install \
    && bundle clean --force

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000 
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
