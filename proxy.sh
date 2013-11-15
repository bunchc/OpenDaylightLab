# Install apt-cacher
export DEBIAN_FRONTEND=noninteractive
apt-get update && sudo apt-get install apt-cacher-ng -y

# Use host for cache directory, makes cache directory persistent between proxy server rebuilds
mkdir -p /vagrant/apt-cacher-ng
rm -rf /var/cache/apt-cacher-ng
cd /vagrant
cp -R apt-cacher-ng/ /var/cache
chown -R apt-cacher-ng:apt-cacher-ng /var/cache/apt-cacher-ng

# Setup our repo's
sudo apt-get update
sudo apt-get install iftop iptraf vim curl wget lighttpd -y

echo 'Acquire::http { Proxy "http://172.16.0.110:3142"; };' | sudo tee /etc/apt/apt.conf.d/01apt-cacher-ng-proxy
