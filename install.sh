#!/usr/bin/env bash

# Copyright 2017 Mycroft AI Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Update
sudo apt-get update -y
pip install --upgrade pip
# Install virtualenv and create venv
pip3 install virtualenv
python3 -m virtualenv .venv
# Activate venv
source $(pwd)/.venv/bin/activate
pip install --upgrade pip
# Install swig
APT_PACKAGE_LIST="git python3 python3-dev python3-setuptools libtool \
    libffi-dev libssl-dev autoconf automake bison swig libglib2.0-dev \
    portaudio19-dev mpg123 screen flac curl libicu-dev pkg-config \
    libjpeg-dev libfann-dev build-essential jq pulseaudio \
    pulseaudio-utils"
sudo apt-get install -y $APT_PACKAGE_LIST
# Install HolmesV
pip3 install HolmesV
pip3 install HolmesV[bus]
pip3 install HolmesV[skills]
# Install lingua_franca
pip3 install lingua_franca
# Create Skills folder
setup_user=$USER
setup_group=$(id -gn $USER)
sudo mkdir -p /opt/mycroft/skills
sudo chown -R ${setup_user}:${setup_group} /opt/mycroft
# Create config
if [[ ! -f /etc/mycroft/mycroft.conf ]]; then
  sudo mkdir -p /etc/mycroft
  sudo touch /etc/mycroft/mycroft.conf
  sudo bash -c 'echo "{ \"use_precise\": true }" > /etc/mycroft/mycroft.conf'
fi
# Install HiveMind
pip3 install git+https://github.com/Joanguitar/HiveMind-core
# Install extra dependencies
pip3 install pyaudio alsaaudio
