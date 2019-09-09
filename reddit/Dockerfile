FROM ruby:2.4.2

RUN gem install bundler

RUN cd / && git clone https://github.com/express42/reddit.git
RUN cd /reddit && bundle install

