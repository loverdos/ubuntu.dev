FROM loverdos/ubuntu.base:latest
LABEL maintainer Christos KK Loverdos <loverdos@gmail.com>

ADD dev-append-config.fish $PLAIN_USER_HOME
ADD dev-append-profile.sh $PLAIN_USER_HOME
RUN chown.sh dev-append-*
RUN install-config.sh dev

ADD dev-install-dev.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-dev.sh
RUN dev-install-dev.sh

# install: java
ADD dev-install-java.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-java.sh
RUN dev-install-java.sh

# install: scala
ADD dev-install-scala.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-scala.sh
RUN dev-install-scala.sh

# install: python
ADD dev-install-python.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-python.sh
RUN dev-install-python.sh

# install: rust
ADD dev-install-rust.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-rust.sh
RUN dev-install-rust.sh

# install: nix
ADD dev-install-nix.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-nix.sh
RUN dev-install-nix.sh

# install: go
ADD dev-install-go.sh $PLAIN_USER_HOME
RUN chown.sh dev-install-go.sh
RUN dev-install-go.sh


# (WAT) install: docker
# ADD dev-install-docker.sh $PLAIN_USER_HOME
# RUN chown.sh dev-install-docker.sh
# RUN dev-install-docker.sh

