service:
  simpleservice:
    users:
      bob:
        - password
        - shell
      alice:
        - password
        - shell
      charle:
        - password
        - nologin
    config:
      port: 2048
      maxports: 1024
      workerthreads: 12
      user: root
      basedir: /
      interface: 0.0.0.0

