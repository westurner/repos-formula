
# repos.hg

{% from "repos/map.jinja" import repos with context %}

include:
  - repos

repos-git-user:
  user.present:
    - name: {{ repos.git_user }}
    - gid_from_name: True
    - home: {{ repos.git_path }}
    - shell: /bin/bash ## TODO
    - comment: "Git user"
    - require_in:
      - user: repos-user


repos-git-directory:
  file.directory:
    - name: {{ repos.git_path }}
    - dir_mode: 0775
    - user: {{ repos.git_user }}
    - group: {{ repos.group }}
    - require:
      - user:
        - repos-git-user
        - repos-user

include:
  - mercurial-server
