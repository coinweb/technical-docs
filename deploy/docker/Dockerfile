FROM ruby:2.6.3

RUN gem install bundler

COPY ./Gemfile /usr/src/app/
COPY ./Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app
VOLUME /usr/src/app

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--watch"]
