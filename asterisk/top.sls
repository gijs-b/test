{% set path='/tmp/iptables.rules' %}

asterisk:
 archive.extracted:
  - name: /usr/src
  - source: http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13-current.tar.gz
  - source_hash: md5=afc8a5b7fc239c7aa5692b563d7e6ed2
  - tar_options: zxvf
  - archive_format: tar

iptables:
  pkg:
    - installed
  file.managed:
    - name: {{ path }}
    - user: root
    - group: root
    - mode: 755
    - source: salt://firewall/iptables.rules
  cmd.wait:
    - name: iptables-restore < {{ path }}
    - watch:
      - file: iptables
    - require:
      - pkg: iptables
