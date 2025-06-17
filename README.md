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
