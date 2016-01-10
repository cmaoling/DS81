
sudo apt-get update
sudo apt-get install -y  gparted testdisk git
echo "GIT setup:"
git config --global user.email "colinas.maoling@t-online.de"
git config --global user.name "Colinas Maoling"
if [ -d DS81 ]; then
  git pull
else
  git clone https://github.com/cmaoling/DS81.git
fi
#https://raw.githubusercontent.com/cmaoling/DS81/master/bootstrap.sh
