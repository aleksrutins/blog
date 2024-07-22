ARG RUBY_VERSION=3.3.2
FROM ruby:$RUBY_VERSION-slim as base

# Rack app lives here
WORKDIR /app

# Update gems and bundler
RUN gem update --system --no-document && \
    gem install -N bundler


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential

RUN useradd ruby --home /app --shell /bin/bash
RUN chown -R ruby:ruby /app
USER ruby:ruby

# Install application gems
COPY --chown=ruby:ruby Gemfile* .bundle/ ./
RUN bundle config set path vendor/bundle && bundle install

# Run and own the application files as a non-root user for security

# Copy application code
COPY --chown=ruby:ruby . .

# Start the server
EXPOSE 8080
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "8080"]
