{% set path='/tmp/iptables.rules' %}

asterisk:
 archive.extracted:
  - name: /usr/src
  - source: http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13-current.tar.gz
  - source_hash: md5=afc8a5b7fc239c7aa5692b563d7e6ed1
  - tar_options: zxvf
  - archive_format: tar
iptables:
 iptables.append:
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 80
    - proto: tcp
    - sport: 1025:65535
    - save: True
