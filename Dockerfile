FROM ruby:2.6-slim-buster as base

ENV TZ=Asia/Tokyo
ENV LANG=C.UTF-8\
    GEM_HOME=/bundle\
    BUNDLE_JOBS=4\
    BUNDLE_RETRY=5
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH\
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH=/app/bin:$BUNDLE_BIN:$PATH

RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    default-mysql-client \
    git \
    tzdata \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

RUN gem update --system && gem install bundler && gem install bundler -v '<2'

WORKDIR /app
CMD ["/bin/bash"]

####################
FROM base as develop-app
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    nodejs \
    openssl \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log
