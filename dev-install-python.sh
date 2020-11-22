#!/usr/bin/env bash

set -euxo pipefail

# install: python
sudo -E apt install -y python3 python3-pip python3-venv pipenv bpython3 ipython3 

sudo apt-get autoremove -y
sudo apt-get autoclean -y

# pip3 install numpy matplotlib statsmodels pandas scipy theano \
#       nltk spacy gensim pattern scikit-learn keras torch tensorflow \
#       bokeh seaborn plotly \
#       pygments pydot pipx ansible salt

pip3 install numpy matplotlib statsmodels pandas scipy theano \
      nltk scikit-learn \
      bokeh seaborn plotly \
      pydot pipx \
      pgcli mycli litecli \
      visidata

rm -rf ~/.cache/pip