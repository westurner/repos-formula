
{% from "repos/map.jinja" import repos with context %}

# Users / Groups

repos-user:
  user.present:
    - name: {{ repos.user }}
    - gid_from_name: True
    - home: {{ repos.home }}
    - shell: /bin/bash
    - comment: "Repos user"
    - empty_password: True

repos-git-user:
  user.present:
    - name: {{ repos.git_user }}
    - gid_from_name: True
    - home: {{ repos.git_path }}
    - shell: /bin/bash ## TODO
    - comment: "Git user"

repos-hg-user:
  user.present:
    - name: {{ repos.hg_user }}
    - gid_from_name: True
    - home: {{ repos.hg_path }}
    - shell: /bin/bash ## TODO
    - comment: "Hg user"


# Directories

repos-directory:
  file.directory:
    - name: {{ repos.repos_path }}
    - dir_mode: 0775
    - user: {{ repos.user }}
    - group: {{ repos.group }}
    - require:
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

# Packages
include:
  - repos.pyrpo
  - mercurial-server
