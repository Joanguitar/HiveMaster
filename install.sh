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
sudo apt-get install -y swig
# Install fann
sudo apt-get install -y libfann-dev
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
# Install HiveMind
pip3 install git+https://github.com/Joanguitar/HiveMind-core
