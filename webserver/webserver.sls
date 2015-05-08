apache2:
 pkg:
  - installed
 service.running:
  - enable: True

/var/www/html/test.html:
  file.managed:
    - source: salt://test.html
