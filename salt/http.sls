{% for i in range(1000) %}
{% set name = 'test%03d' % i %}
/tmp/{{ name }}:
  file.managed:
    - source: http://{{ opts.master }}/files/{{ name }}
    - source_hash: http://{{ opts.master }}/files/{{ name }}.hash
{% endfor %}