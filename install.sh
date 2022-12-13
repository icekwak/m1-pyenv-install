#!/bin/bash

ARCH_NAME=$(arch)

if [[ $ARCH_NAME == "i386" ]]
then
        echo ""
else
        echo "===================================="
        echo "ERR ) arch: $ARCH_NAME"
        echo "Hint) Open a terminal using Rosetta."
        echo "===================================="
fi
