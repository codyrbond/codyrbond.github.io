#STEP 1
#FROM ruby:2.5

#WORKDIR /usr/src/app

# we put README.md as placeholder, because Docker cannot create empty container
#COPY README.md ./

#create volume for later mounting of your local directory
#VOLUME /usr/src/app

#STEP 3

FROM ruby:2.5

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# prepare to install ruby packages into container
COPY Gemfile Gemfile.lock minimal-mistakes-jekyll.gemspec ./

RUN bundle install

VOLUME /usr/src/app

EXPOSE 4000

CMD ["jekyll", "serve"]
