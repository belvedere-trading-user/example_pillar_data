export CC=gcc
export CXX=g++
echo 192.168.0.20 salt saltmaster1 >> /etc/hosts
echo 192.168.0.31 saltminion >> /etc/hosts
rm -f /etc/yum.repos.d/puppet*
yum clean all
python /vagrant/files/get-pip.py
yum install python-devel gcc-c++ -y
pip uninstall setuptools -y
#yum reinstall python-setuptools -y
pip install setuptools --upgrade 
pip install pycrypto -b /tmp/vagrant
pip install pyzmq -b /tmp/vagrant
mkdir -p /etc/salt/pki/minion
cp /vagrant/files/minion /etc/salt
rm -f /etc/salt/pki/minion/*
pip install salt -b /tmp/vagrant
rpm -ivh /vagrant/files/salt-scripts-1.0-1.el6.x86_64.rpm
echo $HOSTNAME > /etc/salt/minion_id
echo "id: $HOSTNAME" > /etc/salt/minion
service salt-minion restart
