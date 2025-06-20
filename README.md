# WIP Structure

## Playbooks

These are the plays (scripts) that Ansible runs to do different things,
like launching the EC2 instance, launching the Docker, etc.

## Roles

Here we find reusable data. That can be the sites themselves (Docker Wordpress, Inception)

## Inventory

Here we save all of the hosts our Ansible machine can handle.
We can have them in `.ini` form:

```ini
[web]
192.168.1.10

[db]
db.example.com
```

Or preferably in `.yml`:

```yaml
all:
  children:
    wordpress:
      hosts:
        ec2-XX-XX-XX-XX.compute-1.amazonaws.com:
```

These go in a `hosts.yml` or `hosts.ini` file and are automatically discovered by Ansible.
We can also put `host_vars/` to isolate variables per host.

## Requirements

- In case of reboot, all data must persist
  - Docker volumes, nothing else?
- Possible to deploy your site on multiple servers in parallel
  - Add multiple hosts to `ansible.cfg`
- The script must function in an automatic way assuming Ubuntu 20.04 LTS with SSH and Python
- Depending on the requested URL, the server must redirect to the correct site

## Completed requirements

- The SQL database must work with WordPress and PHP-MyAdmin
- Restart automatically if the server is rebooted
- There must be a `docker-compose.yml`
- The services are the components of a WordPress site
- One application per container
- The server must use TLS
- Public access to the server must be limited, unable to connect to the DB
