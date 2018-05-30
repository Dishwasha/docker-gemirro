FROM ruby:2.4

MAINTAINER thinkbot@outlook.de

ENV VERSION=0.9.1

RUN gem install gemirro --version ${VERSION} --no-format-exec
RUN sed -i 's/gemirro\.access\.log'/gemirro\.access\.log',\ndaemonize: true/' /usr/local/bundle/gems/gemirro-0.9.1/lib/gemirro/configuration.rb
RUN sed -i 's/Process.daemon/Process.daemon if Gemirro\.configuration\.server\.daemonize/' /usr/local/bundle/gems/gemirro-0.9.1/lib/gemirro/cli/server.rb

WORKDIR /tmp

ENTRYPOINT ["gemirro"]
CMD ["--help"]
