pip install --upgrade pip
pip install virtualenv
python -m virtualenv venv

:: Install pipwin
.\venv\Scripts\pip install pipwin
.\venv\Scripts\pipwin install pyaudio
.\venv\Scripts\pipwin install fann2

:: Install HolmesV
.\venv\Scripts\pip install HolmesV HolmesV[bus] lingua_franca
:: Install HolmesV[skills] extras
.\venv\Scripts\pip install msm msk adapt-parser padatious padaos
:: Install HiveMind
.\venv\Scripts\pip install git+https://github.com/JarbasHiveMind/HiveMind-core
