#!jinja|deepmerge
hostspecificdata: 1
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

