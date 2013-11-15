. /vagrant/common.sh

MY_IP=$(ifconfig eth1 | awk '/inet addr/ {split ($2,A,":"); print A[2]}')

# Install a desktop
sudo apt-get -y no-install-recommends install ubuntu-desktop wireshark

# Install Mininet
sudo apt-get -y install git-core openssh-server
git clone git://github.com/mininet/mininet /home/vagrant/mininet
cd /home/vagrant/mininet
cd
time /home/vagrant/mininet/util/install.sh

sudo mn --test pingall

sudo /etc/init.d/openvswitch-controller stop

# Install Open Daylight
apt-get install -y maven git openjdk-7-jre openjdk-7-jdk unzip
wget https://jenkins.opendaylight.org/controller/job/controller-merge/lastSuccessfulBuild/artifact/opendaylight/distribution/opendaylight/target/distribution.opendaylight-osgipackage.zip -O /home/vagrant/distribution.opendaylight-osgipackage.zip
unzip /home/vagrant/distribution.opendaylight-osgipackage.zip -d /home/vagrant

cd /home/vagrant/opendaylight

echo "Install done, run the following:"
echo "--------------------------------"
echo "ssh -XY ${MY_IP}"
echo "export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64"
echo "bash /home/vagrant/opendaylight/run.sh"
echo
echo "mn --controller=remote,ip=${MY_IP} --topo=linear,2 --listenport=6633"
echo "sudo wireshark"
echo "--------------------------------"
echo "You can also browse to http://${MY_IP}:8080"
