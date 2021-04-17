nginx:
  pkg.installed:
    - name: nginx
  file.managed:
    - name: /etc/nginx/sites-available/default
    - contents: |
        server {
          listen 80 default_server;
          root /srv/salt;
        }
    - require:
        - pkg: nginx
  service.running:
    - reload: true
    - watch:
        - file: nginx