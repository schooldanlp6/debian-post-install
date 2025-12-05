echo "Installing Nvidinux"
echo "Continue Installing this non-Core part of debian-post-install? (y/N: default N): "
cd Nvidinux
chmod +x graphicsat.sh
chmod +x graphicsde.sh
chmod +x graphicsdet.sh
sudo cp graphicsat.sh /bin/
sudo cp graphicsde.sh /bin/
sudo cp graphicsdet.sh /bin/
