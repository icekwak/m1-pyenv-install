#!/bin/bash

ARCH_NAME=$(arch)

if [[ $ARCH_NAME == "i386" ]]
then
        echo "> Homebrew Install.."

        arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'alias brew86="arch -x86_64 /usr/local/bin/brew"' >> ~/.zshrc
        source ~/.zshrc

        echo
        echo "> pyenv gcc zlib bzip2 ncurses SQLite3 Install.."

        brew86 install pyenv gcc zlib bzip2 ncurses SQLite3
        echo 'export LDFLAGS="-L/usr/local/opt/zlib/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/zlib/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PATH="/usr/local/opt/bzip2/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/bzip2/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/bzip2/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PATH="/usr/local/opt/ncurses/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/ncurses/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/ncurses/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/sqlite/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/sqlite/include $CPPFLAGS"' >> ~/.zshrc
        source ~/.zshrc

        GCC_NAME=$(ls -al /usr/local/bin | awk '{print $9}' | grep '^gcc-[0-9]')
        echo 'alias gcc_pyenv="CC=`which $GCC_NAME` pyenv"' >> ~/.zshrc
        source ~/.zshrc
else
        echo "===================================="
        echo "ERR ) arch: $ARCH_NAME"
        echo "Hint) Open a terminal using Rosetta."
        echo "===================================="
fi
