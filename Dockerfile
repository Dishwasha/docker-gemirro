FROM ruby:2.4

MAINTAINER thinkbot@outlook.de

ENV VERSION=0.9.1

RUN gem install gemirro --version ${VERSION} --no-format-exec

WORKDIR /tmp

ENTRYPOINT ["gemirro"]
CMD ["--help"]
