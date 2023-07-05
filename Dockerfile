FROM ruby:3.2.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential nodejs

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.4.10
RUN bundle install

COPY . .

EXPOSE 3000

RUN bin/rails db:drop db:create db:migrate db:seed RAILS_ENV=development

CMD ["rails", "server", "-b", "0.0.0.0"]
