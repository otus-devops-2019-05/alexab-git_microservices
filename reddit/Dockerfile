FROM ruby:2.4.2

RUN apk update -qq && apk add --no-cache --virtual build-dependencies build-base ruby ruby-dev ruby-json \
    && gem install bundler --no-ri --no-rdoc 

RUN git clone  https://github.com/express42/reddit.git
RUN cd /reddit 
RUN bundle install

