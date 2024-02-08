#!/bin/bash

# Check if python is installed, error if not
python --version >/dev/null 2>&1
if [ $? -ne 0 ]; then
    python3 --version >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        py3 --version >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Python is not installed. Please install python and try again."
            read -p "Press any key to continue..." -n 1 -r
            exit 1
        else
            PYTHON_BIN=py3
        fi
    else
        PYTHON_BIN=python3
    fi
else
    PYTHON_BIN=python
fi

# Switch to script directory
cd "$(dirname "$0")"

echo "$(dirname "$0")"
$PYTHON_BIN PalEdit.py
if [ $? -ne 0 ]; then
    read -p "Press any key to continue..." -n 1 -r
fi
