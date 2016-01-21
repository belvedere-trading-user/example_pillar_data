#!/usr/bin/python
import logging

log = logging.getLogger(__name__)

def __virtual__():
    return True

def ext_pillar(minion_id, pillar, *args, **kwargs):
    jobs = {}
    for item in pillar['service']:
        log.critical(item)
        if 'config' in item:
            if 'starttime' in item['config']:
                jobname = '{0}_start'.format(item)
                jobs[jobname] = {'function': 'service.start',
                                 'args': item,
                                 'cron': item['config']['starttime']}

            if 'endtime' in item['config']:
                jobname = '{0}_stop'.format(item)
                jobs[jobname] = {'function': 'service.stop',
                                 'args': item,
                                 'cron': item['config']['stoptime']}
    return {'schedule': jobs}

