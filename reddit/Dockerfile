FROM ruby:2.4.2

RUN gem install bundler

RUN cd / && git clone https://github.com/express42/reddit.git
RUN cd /reddit && git checkout https://gist.github.com/d70ff7c6d1c02de8f18bcd049e904942.git && bundle install

CMD ["puma"]

