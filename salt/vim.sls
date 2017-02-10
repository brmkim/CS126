{% if grains['os'] == 'Redhat' %}
install vim:
    pkg.installed:
        - name: vim_enhanced
{% elif grains['os'] == 'Debian' %}
install vim:
    pkg.installed:
        - name: vim
{% endif %}

