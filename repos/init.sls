
{% from "repos/map.jinja" import repos with context %}

repos-user:
  user.present:
    - name: {{ repos.user }}
    - gid_from_name: True
    - home: {{ repos.home }}
    - shell: /bin/bash
    - comment: "Repos user"
    - groups: hg git


repos-directory:
  file.directory:
    - name: {{ repos.repos_path }}
    - dir_mode: 0775
    - user: {{ repos.user }}
    - group: {{ repos.group }}
    - require:
      - user: repos-user




include:
  - repos.pyrpo
