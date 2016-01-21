base:
  '*':
    - service.simpleservice
#    - service.service_with_defaults
#    - service.myservice
#    - service.sqlservices

#{% if salt['file.file_exists']('/srv/pillar/hosts/' + grains.id + '.sls') %}
#  '{{ grains.id }}':
#    - hosts.{{ grains.id }}
#{%   if salt['file.file_exists']('/srv/pillar/hosts/' + grains.id + '_overrides.sls') %}
#    - hosts.{{ grains.id }}_overrides
#{%   endif %}
#{% elif salt['file.file_exists']('/srv/pillar/hosts/' + grains.id + '_overrides.sls') %}
#  '{{ grains.id }}':
#    - hosts.{{ grains.id }}_overrides
#{% endif %}

