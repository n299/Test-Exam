FROM ruby:2.6.3
RUN apt-get update && \
    apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y --no-install-recommends \
    nodejs \
    yarn
RUN mkdir /rails-app
WORKDIR /rails-app
ENV GEM_HOME /rails-app/vendor/bundle
ENV BUNDLE_PATH /rails-app/vendor/bundle
ENV BUNDLE_BIN /rails-app/vendor/bundle/bin
ENV BUNDLE_VERSION 2.1.4
ENV PATH $BUNDLE_BIN:$BUNDLE_PATH/gems/bin:$PATH
RUN gem install bundler && gem update --system
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]
