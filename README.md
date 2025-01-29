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

Build a new project using this template (replace `{REPO_NAME}` with a proper Git repository name):

```shell
gh repo create itk-dev/{REPO_NAME} --template itk-dev/drupal-11-template --public --clone
```

Install the newest docker compose setup from [https://github.com/itk-dev/devops_itkdev-docker](https://github.com/itk-dev/devops_itkdev-docker).

```shell
task docker:install
```

### Prune the project

Prune the project to remove/override template specific files and set up the
project with docker config and settings:

```shell
task template-prune PROJECTNAME={PROJECTNAME}
```

> [!IMPORTANT]
> Replace `{PROJECTNAME}` with your actual project name.
This will:

- Remove TEMPLATE_THEME and cause coding-standards-check to fail until a new
theme is added.
- Add/override .env and .task.env files with files that uses {PROJECTNAME}
- Add/override a settings.local.php to web/sites/default folder
- Add/override a services.local.yml to web/sites/default folder
- Override CHANGELOG.md
- Replace {PROJECTNAME} placeholder in README.md and CHANGELOG.md
- Override Taskfile.yml
