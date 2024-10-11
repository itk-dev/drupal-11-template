# Drupal 11 TEMPLATE

This is a Drupal project template for starting new projects. The template
includes default setup and a starting point for:

- PHP Code sniffer
- PHP Code styles
- Github actions
- Tasks
- Local settings
- Docker and overrides
- Readme
- Changelog

## Usage

### Build new project from template

Build a new project using this template

``` shell
gh repo create itk-dev/{PROJECT-NAME} --template itk-dev/drupal-11-template --public --clone 
```

### Prune the project

Prune the project to remove/override template specific files and setup the
project, with docker config and settings.

``` shell
task template-prune {PROJECTNAME}
```

This will:

- Remove TEMPLATE_THEME and cause coding-standards-twig to fail until a new
theme is added.
- Add/override .env and .task.env files with files that uses {PROJECTNAME}
- Add/override a settings.local.php to web/sites/default folder
- Override CHANGELOG.md
- Override Taskfile.yml

### Finish

- Replace {PROJECT-NAME} placeholder in this README.md and CHANGELOG.md

<!-- markdownlint-disable MD025 -->

### ---- After building a project delete this line and all above ----

# Readme for {PROJECT-NAME}

## Build assets

### Site installation

Run the following commands to set up the site. This will run a normal Drupal site installation with the existing
configuration that comes with this project.

``` shell name="site-up"
itkdev-docker-compose up --detach
itkdev-docker-compose composer install
itkdev-docker-compose drush site-install --existing-config --yes
```

When the installation is completed, that admin user is created and the password for logging in the outputted. If you
forget the password, use drush uli command to get a one-time-login link (not the uri here only works if you are using
trafik).

``` shell name="site-login"
itkdev-docker-compose drush user:login
```

### Access the site

If you are using out `itkdev-docker-compose` simple use the command below to åbne the site in you default browser.

``` shell name="site-open"
itkdev-docker-compose open
```

Alternatively you can find the port number that is mapped nginx container that server the site at `http://0.0.0.0:PORT`
by using this command:

``` shell
open "http://$(docker compose port nginx 8080)"
```

### Drupal config

This project uses Drupal's configuration import and export to handle configuration changes and uses the [config
ignore](https://www.drupal.org/project/config_ignore) module to protect some of the site settings form being overridden.
For local and production configuration settings that you do not want to export, please use `settings.local.php` to
override default configuration values.

Export config created from drupal:

```shell
itkdev-docker-compose drush config:export
```

Import config from config files:

``` shell
itkdev-docker-compose drush config:import
```

### Coding standards

``` shell name=coding-standards-composer
docker compose exec phpfpm composer install
docker compose exec phpfpm composer normalize
```

``` shell name=coding-standards-php
docker compose exec phpfpm composer install
docker compose exec phpfpm composer coding-standards-apply/phpcs
docker compose exec phpfpm composer coding-standards-check/phpcs
```

``` shell name=coding-standards-twig
docker compose exec phpfpm composer install
docker compose exec phpfpm composer coding-standards-apply/twig-cs-fixer
docker compose exec phpfpm composer coding-standards-check/twig-cs-fixer
```

``` shell name=code-analysis
docker compose exec phpfpm composer install
docker compose exec phpfpm composer code-analysis
```

``` shell name=coding-standards-markdown
docker run --platform linux/amd64 --rm --volume "$PWD:/md" peterdavehello/markdownlint markdownlint $(git ls-files *.md) --fix
docker run --platform linux/amd64 --rm --volume "$PWD:/md" peterdavehello/markdownlint markdownlint $(git ls-files *.md)
```
