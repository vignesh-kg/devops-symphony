#!/bin/bash

export python_version=

#Check if Python is installed
if command -v python3 >/dev/null; then
  python_version="python3";
  echo $python_version." is installed"
elif command -v python >/dev/null; then
  python_version="python";
  echo $python_version." is installed"
else
  echo "Python is not installed. Please install Python first"
  exit 1
fi

# Check if pip is installed
if [ ! -f /usr/bin/pip ]; then
  echo "pip is not installed. Installing pip"
  $python_version -m pip install --upgrade pip
fi

# Check if Ansible is already installed
if $python_version -m pip show ansible; then
  echo "Ansible is already installed. Skipping installation."
  exit 0
fi

# Install Ansible using pip
#python3 -m pip install ansible