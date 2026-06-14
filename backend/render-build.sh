#!/usr/bin/env bash
# exit on error
set -o errexit

# Install python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Download and extract ffmpeg static binaries for audio analysis
echo "Downloading ffmpeg..."
mkdir -p bin
wget -q https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
tar -xf ffmpeg-release-amd64-static.tar.xz
mv ffmpeg-*-amd64-static/ffmpeg bin/
mv ffmpeg-*-amd64-static/ffprobe bin/
rm -rf ffmpeg-release-amd64-static.tar.xz ffmpeg-*-amd64-static
echo "ffmpeg installation complete!"

# Initialize the SQLite database
python setup_db.py
python seed.py
