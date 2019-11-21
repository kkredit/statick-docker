# Filename: statick.dockerfile
# Author: Kevin Kredit
# License: Creative Commons Zero v1.0 Universal
# Description:
#   Dockerfile to encapsulate the Statick envrinment

# Image settings
FROM ubuntu:16.04
ARG INST_DIR=/opt/statick
ARG USER_NAME=statick
ARG USER_UID=1000
ARG USER_GID=1000

# Basic setup
RUN \
    # Updates and pip
    apt-get update                                          && \
    apt-get install -y apt-utils                            && \
    apt-get upgrade -y                                      && \
    apt-get install -y python-pip                           && \
    pip install --upgrade pip                               && \
    echo "from pip import __main__" > /usr/bin/pip          && \
    echo "if __name__ == '__main__':" >> /usr/bin/pip       && \
    echo "    sys.exit(__main__._main())" >> /usr/bin/pip   && \
    \
    # Create non-root user
    groupadd -g $USER_GID $USER_NAME                                                    && \
    useradd --create-home -s /bin/bash -u $USER_UID -g $USER_GID $USER_NAME             && \
    usermod -aG sudo $USER_NAME                                                         && \
    echo "cd /host" >> /home/$USER_NAME/.bashrc                                         && \
    echo "echo 'Welcome to the Statick Docker environment'" >> /home/$USER_NAME/.bashrc && \
    \
    # Create installation directory
    mkdir -p $INST_DIR

# Populate installation directory
COPY statick/ $INST_DIR/

# Statick-specific installs in separate step for faster rebuilds
RUN chown -R $USER_NAME:$USER_NAME $INST_DIR    && \
    cd $INST_DIR/                               && \
    cat install.txt | xargs apt-get install -y  && \
    pip install -r requirements.txt             && \
    python setup.py install                     && \
    pip install tox

# Enter the container as the non-root user
USER $USER_NAME
