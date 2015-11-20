#!jinja|deepmerge
service:
  service1:
{% include 'default/service_defaults.sls' %}
  serviceA:
{% include 'default/service_defaults.sls' %}
========
service:
  serviceA:
    config:
      port: 1433
  serviceC:
    config:
      maxports: 4096
  service3:
    additional_config_section:
      - New 
      - parameters
      - that
      - don't
      - exist
      - in
      - the
      - default
      - data
