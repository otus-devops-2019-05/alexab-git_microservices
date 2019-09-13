FROM ruby:2.4.2

RUN gem install bundler

RUN cd / && git clone https://github.com/express42/reddit.git
RUN cd /reddit && wget https://gist.githubusercontent.com/Nklya/d70ff7c6d1c02de8f18bcd049e904942/raw/9c82d9a0f16c38b905c7721f54b9b85fff903b3a/simpletest.rb && bundle install

CMD ["puma"]

