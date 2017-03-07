sshd:
    pkg.installed:
        - name: openssh-server
    service.running:
        - name: sshd
        - confdir: /etc/ssh/
        - sshd_config_name: sshd_config
        - enable: True
