#!/usr/bin/python
import logging

log = logging.getLogger(__name__)

def __virtual__():
    return True

def ext_pillar(minion_id, pillar, *args, **kwargs):
    jobs = {}
    jobs['joba'] = {'function':'service.stop','args':'service','cron':'1 1 1 1 1'}
    return {'schedule': jobs}

