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
# Parameters
name="TestUser"
access_key="WeakestPasswordEver"
crypto_key=""

# Activate venv and initiale HiveMind-core database
source $(pwd)/.venv/bin/activate
if [ ${crypto_key}=="" ]
then
  python3 -m jarbas_hive_mind.database add --name ${name} --access_key ${access_key}
else
  python3 -m jarbas_hive_mind.database add --name ${name} --access_key ${access_key} --crypto_key ${crypto_key}
fi
