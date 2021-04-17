{% for i in range(1000) %}
{% set name = 'test%03d' % i %}
/tmp/{{ name }}:
  file.managed:
    - contents: test
{% endfor %}