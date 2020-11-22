#!/usr/bin/env bash

set -euxo pipefail

# install: sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add

sudo bash -c '
  apt update && apt install -y sbt && apt-get autoremove -y && apt-get autoclean -y
'

# install: ammonite
sudo -E sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/2.2.0/2.13-2.2.0) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm'

# install: coursier
sudo -E sh -c 'curl -L https://git.io/coursier-cli-linux > /usr/local/bin/coursier && chmod +x /usr/local/bin/coursier'

# get some sbt, ammomite stuff done ...
cd ~; mkdir tmp; cd tmp; sbt exit; cd ~; rm -rf tmp/
amm -c 'System.exit(0)'

rm -rf ~/.cache