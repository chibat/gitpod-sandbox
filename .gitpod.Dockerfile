FROM gitpod/workspace-full
                    
# USER gitpod

ENV DENO_DIR=/workspace/.deno
ENV DENO_INSTALL=$HOME/.deno
ENV PATH=$DENO_INSTALL/bin:$PATH
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

RUN npm install @openapitools/openapi-generator-cli -g

# neovim
RUN cd /workspace && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
ENV PATH=/workspace/squashfs-root/usr/bin:$PATH

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
