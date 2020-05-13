FROM gitpod/workspace-full
                    
# USER gitpod

ENV DENO_INSTALL /home/gitpod/workspace/bin
RUN sudo apt-get -q update && sudo apt-get -yq install neovim
RUN sudo ln -s /usr/bin/nvim /usr/local/bin/nvim


# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
