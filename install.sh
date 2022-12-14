#!/bin/bash

ARCH_NAME=$(arch)

if [[ $ARCH_NAME == "i386" ]]
then
        echo 
        echo 
        echo "===================="
        echo "> Homebrew Install.."
        echo "===================="
        arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        echo 
        echo 
        echo "================================================"
        echo "> pyenv gcc zlib bzip2 ncurses SQLite3 Install.."
        echo "================================================"
        arch -x86_64 /usr/local/bin/brew install pyenv gcc zlib bzip2 ncurses SQLite3
        
        GCC_NAME=$(ls -al /usr/local/bin | awk "{print $9}" | grep "^gcc-[0-9]")
        
        echo "###### Settings required to install Python ######" >> ~/.zshrc
        
        # alias
        echo 'alias brew86="arch -x86_64 /usr/local/bin/brew"' >> ~/.zshrc
        echo 'alias pyenv86="CC=`which $GCC_NAME` pyenv"' >> ~/.zshrc
        
        # zlib
        echo 'export LDFLAGS="-L/usr/local/opt/zlib/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/zlib/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"' >> ~/.zshrc
        
        # bzip
        echo 'export PATH="/usr/local/opt/bzip2/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/bzip2/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/bzip2/include $CPPFLAGS"' >> ~/.zshrc
        
        # ncurses
        echo 'export PATH="/usr/local/opt/ncurses/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/ncurses/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/ncurses/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig:$PKG_CONFIG_PATH"' >> ~/.zshrc
        
        # sqlite
        echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc
        echo 'export LDFLAGS="-L/usr/local/opt/sqlite/lib $LDFLAGS"' >> ~/.zshrc
        echo 'export CPPFLAGS="-I/usr/local/opt/sqlite/include $CPPFLAGS"' >> ~/.zshrc
        echo 'export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"' >> ~/.zshrc
        
        echo "#################################################" >> ~/.zshrc
        source ~/.zshrc

        echo 
        echo 
        echo "=============== Info ==============="
        echo "> Version Info."
        echo "Homebrew $/usr/local/bin/brew --version)"
        echo "pyenv $(pyenv --version)"
        echo
        echo "> How to install Python. (pyenv86 install {Python Version})"
        echo "ex) pyenv86 install 3.7.7"
        echo 
        echo "Made by YeongJu-Kwak"
        echo "===================================="
        echo 
        echo "Finished."
else
        echo 
        echo "===================================="
        echo "ERR ) arch: $ARCH_NAME"
        echo "Hint) Open a terminal using Rosetta."
        echo "===================================="
        echo 
fi
