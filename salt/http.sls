{% for i in range(1000) %}
{% set name = 'test%03d' % i %}
/tmp/{{ name }}:
  file.managed:
    - source: http://{{ opts.master }}/files/{{ name }}
    - skip_verify: true
{% endfor %}