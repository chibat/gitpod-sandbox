FROM gitpod/workspace-full
                    
# USER gitpod

ENV DENO_DIR=/workspace/.deno
ENV DENO_INSTALL=$HOME/.deno
ENV PATH=$DENO_INSTALL/bin:$PATH
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

RUN npm install @openapitools/openapi-generator-cli -g

# neovim
RUN cd && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract
ENV PATH=$HOME/squashfs-root/usr/bin:$PATH

# coc.nvim
# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
RUN mkdir -p ~/.vim/pack/coc/start && \
    cd ~/.vim/pack/coc/start && \
    curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv - && \
    mkdir -p ~/.config/coc/extensions && \
    cd ~/.config/coc/extensions && \
    echo '{"dependencies":{}}' > package.json \
    npm install coc-tsserver coc-deno

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
