# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# @zamith wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return
# ----------------------------------------------------------------------------

FROM gliderlabs/alpine:3.3
MAINTAINER Zamith <luis@zamith.pt>

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2016-04-23

RUN apk-install \
    ca-certificates \
    erlang-asn1 \
    erlang-crypto \
    erlang-dev \
    erlang-eunit \
    erlang-inets \
    erlang-parsetools \
    erlang-public-key \
    erlang-ssl \
    erlang-syntax-tools \
    erlang-xmerl \
    g++ \
    gcc \
    make \
    git \
    postgresql-client \
    python

RUN wget -O /tmp/elixir.zip https://github.com/elixir-lang/elixir/releases/download/v1.2.4/Precompiled.zip && \
    mkdir -p /opt/elixir && \
    unzip -d /opt/elixir /tmp/elixir.zip && \
    rm -f /tmp/elixir.zip

ENV LANG=en_US.UTF-8 PATH=/opt/elixir/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mix local.hex --force && \
    mix local.rebar --force
