{% for i in range(1000) %}
{% set name = 'test%03d' % i %}
/tmp/{{ name }}:
  file.managed:
    - source: salt://files/{{ name }}
{% endfor %}