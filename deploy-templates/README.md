# Readme for {PROJECTNAME}

Create/edit `.env.task` and set a custom [`docker compose`](https://docs.docker.com/compose/) command if needed, e.g.

``` shell
# .env.task
TASK_DOCKER_COMPOSE=itkdev-docker-compose
```

## Build assets

## Site installation

Run the following commands to set up the site a new. This will start containers
and run composer install, add a settings.php file and run site-install.

```shell name="site-new"
task compose -- up --detach
task composer -- install
task build-site:new
```

If the site has existing config and a settings.php file build the site from that.

```shell name="site-install"
task compose -- up --detach
task composer -- install
task build-site:existing-conf
```

When the installation is completed, that admin user is created and the password for logging in the outputted. If you
forget the password, use `drush user:login` command to get a one-time-login URL (note: the URI here only works if
you are using Traefik and [ITK-dev docker setup](https://github.com/itk-dev/devops_itkdev-docker)).

```shell name="site-login"
itkdev-docker-compose drush user:login
```

### Access the site

If you are using out `itkdev-docker-compose` simple use the command below to åbne the site in you default browser.

```shell name="site-open"
itkdev-docker-compose open
```

Alternatively you can find the port number that is mapped nginx container that server the site at `http://0.0.0.0:PORT`
by using this command:

```shell
open "http://$(docker compose port nginx 8080)"
```

### Drupal config

Export config created from drupal:

```shell
task drush -- config:export
```

Import config from config files:

```shell
task drush -- config:import
```

### Coding standards

```shell name=coding-standards-check
task code:check
```

```shell name=coding-standards-apply
task code:apply-standards
```