{% from "repos/map.jinja" import repos with context %}

include:
  - repos

repos-hg-user:
  user.present:
    - name: {{ repos.hg_user }}
    - gid_from_name: True
    - home: {{ repos.hg_path }}
    - shell: /bin/bash ## TODO
    - comment: "Hg user"
    - require_in:
      - user: repos-user

repos-hg-directory:
  file.directory:
    - name: {{ repos.hg_path }}
    - dir_mode: 0775
    - user: {{ repos.hg_user }}
    - group: {{ repos.group }}
    - require:
      - user:
        - repos-hg-user
        - repos-user
