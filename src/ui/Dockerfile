FROM ruby:2.2

ENV APP_HOME /app

RUN apt-get update -qq && apt-get install --no-install-recommends -y build-essential && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir $APP_HOME

WORKDIR $APP_HOME
COPY . $APP_HOME
RUN bundle install

ENV POST_SERVICE_HOST post \
    POST_SERVICE_PORT 5000 \
    COMMENT_SERVICE_HOST comment \
    COMMENT_SERVICE_PORT 9292

CMD ["puma"]
