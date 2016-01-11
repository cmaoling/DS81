
sudo apt-get update
sudo apt-get install -y  gparted testdisk git
echo "GIT setup:"
git config --global user.email "colinas.maoling@t-online.de"
git config --global user.name "Colinas Maoling"
DEFAULT_REPOSITORY="DS81"
if [ -d  "$DEFAULT_REPOSITORY"]; then
  cd DS81 
  git pull
  cd ..
else
  git clone https://github.com/cmaoling/$DEFAULT_REPOSITORY.git
fi
#https://raw.githubusercontent.com/cmaoling/DS81/master/bootstrap.sh
echo "Git repro set up."
echo "Change User Desktop. Current file: "`gsettings get org.gnome.desktop.background picture-uri`
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/$DEFAULT_REPOSITORY/Bilder/desktop.background
echo "   => "`gsettings get org.gnome.desktop.background picture-uri`
echo "Enable crypt:"
sudo apt-get install -y cryptsetup
export KEYSTICK="DEAD-BEEF"
export KEYSTICK=`cat keystick`
