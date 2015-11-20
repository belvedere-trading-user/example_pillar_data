yum install mysql-server mysql-devel -y
pip install MySQL_python
service mysqld start
mysql -u root < /vagrant/files/samplemysqlpillar.sql
cp /vagrant/pillar/_external_pillars/service_schedules.py /usr/lib/python2.6/site-packages/salt/pillar/service_schedules.py
