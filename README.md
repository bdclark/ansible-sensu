# sensu-client

Install/configure Sensu client

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.

Example Playbook
----------------

TODO: Add example playbook(s).

```yaml
- hosts: sensu_servers
  vars:
    sensu_server_enabled: yes
    sensu_api_enabled: yes
  roles:
     - role: rabbitmq
     - role: redis
     - role: sensu
```

```yaml
- hosts: webservers
  roles:
    - role: sensu
```

### SSL Configuration

#### Generating SSL Keys/Certs
A helper play is included to generate SSL certs/keys and present them as yaml
to be used with this role. It is of course recommended the generated content is
saved using Ansible Vault.

```
ansible-playbook tasks/ssl_generate.yml
```

This will download the sensu ssl tool, generate the ssl content, then save them
to a yaml file. By default the content is saved to `/tmp` but it can be adjusted.
See `tasks/ssl_generate.yml` for details.
