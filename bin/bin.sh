
# Gets triggered from outside! never try to manually trigger this script!

echo "+++ Start: Installing Blobs +++"

# fetch pro-tools from repo
git clone git@github.com:schooldanlp6/pro-tools.git
cd pro-tools
./install.sh
cd ..
rm -fr pro-tools

# copy other binaries
sudo cp codiumtemp /bin/
sudo cp host-on-ygg /bin/
sudo cp neofetch /bin/

echo "+++ End: Installing Blobs +++"
