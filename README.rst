===============================
repos-formula
===============================

Salt formula for managing a local set of {git and hg} repositories

* Free software: BSD license
* SaltStack Formula

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``repos``
-------------------------------------

Installs the repos configuration

* Creates users, groups, and directories for repos, git, hg
* Installs the pyrpo package

TODO: * (Testing) Install the mercurial-server formula  


``repos.pyrpo``
-------------------------------------

Installs the pyrpo package with pip.

