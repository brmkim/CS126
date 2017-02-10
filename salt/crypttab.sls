/etc/crypttab:
    file.managed:
        - source: salt://crypttab
        - mode: 644
        - user: root
        - group: root

