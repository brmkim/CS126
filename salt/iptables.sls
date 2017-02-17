iptables:
    pkg:
        - name: iptables
        - installed

/etc/sysconfig/iptables:
    file.managed:
        - source: /root/labs/lab9a.txt
        - mode: 644
        - user: root
        - group: root
