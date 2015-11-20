#!py
import logging
import MySQLdb

log = logging.getLogger(__name__)

def run():
    pillar = {'service':{}}
    host = __grains__['id']
    db = MySQLdb.connect('127.0.0.1','root','','services')
    cursor = db.cursor()
    cursor.execute('select * from service where server="{0}"'.format(host))
    data = cursor.fetchall()
    for item in data:
        pillar['service'][item[1]] = {'config':{'basedir':item[3],
                                                'interface':item[4],
                                                'maxports':item[5],
                                                'port':item[6],
                                                'user':item[7],
                                                'workerthreads':item[8],
                                                'starttime':item[9],
                                                'endtime':item[10]}}

    return pillar
