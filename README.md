# Sasaya VIM

## Installation

1. Change directory to your home directory.

    ```bash
    cd ~
    ```

2. Copy files to your home directory.

    ```bash
    git clone https://github.com/storyn26383/sasaya-vim.git .vim
    ```

3. Make a symbolic link to vimrc.

    ```bash
    ln -s .vim/.vimrc .vimrc
    ```

4. Initial and update git submodule

    ```bash
    git submodule init
    git submodule update
    ```

5. Install Plugins

    ```bash
    vim +PluginInstall +qall
    ```
