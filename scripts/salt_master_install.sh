mkdir -p /etc/salt/pki/master
cp /vagrant/files/master /etc/salt/master
echo '*' > /etc/salt/autosign.conf
service salt-master stop
service salt-minion stop
rm -f /etc/salt/pki/master/minions/*
rm -f /etc/salt/pki/master/minions_autosign/*
rm -f /etc/salt/pki/master/minions_denied/*
rm -f /etc/salt/pki/master/minions_pre/*
rm -f /etc/salt/pki/master/minions_rejected/*
rm -f /etc/salt/pki/minion/*
chown -R root:root /etc/salt
cp /vagrant/files/master /etc/salt
cp /vagrant/files/deepmerge.py /usr/lib/python2.6/site-packages/salt/renderers/deepmerge.py
service salt-master start
service salt-minion start
