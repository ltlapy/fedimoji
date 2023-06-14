FROM ghcr.io/ltlapy/docker-lapis:amd64

EXPOSE 8080

###
# Set Persistent Deps
ENV BUILD_DEPS \
        build-essential \
        git-core \
        unzip \
        wget

# Install depandency packages
RUN set -xe
RUN apt-get update -y && apt-get install -y --no-install-recommends --no-install-suggests \
    ${BUILD_DEPS} \
    ca-certificates \
    libpcre3-dev \
    libssl-dev \
    zlib1g-dev \
    m4

# Remove apt cache
RUN rm -r /var/lib/apt/lists/*
###

RUN mkdir -p /app
WORKDIR /app

COPY src .
RUN moonc .

CMD ["lapis", "server"]