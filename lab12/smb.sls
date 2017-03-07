samba:
    pkg.installed:
        - name: samba
smb:
    service.running:
        - confdir: /etc/samba/smb.conf
        - enbabled: True

cifs-utils:
    pkg.installed:
        - name: cifs-utils
samba-client:
    pkg.installed:
        - name: samba-client

samba_export_all_ro:
    selinux.boolean:
        - value: True
        - persist: True

samba_export_all_rw:
    selinux.boolean:
        - value: True
        - persist: True

smb.conf:
    file.managed:
        - source: /etc/samba/smb.conf
