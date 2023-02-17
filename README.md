# Redmine Approve Issues Plugin

The Redmine Approve Issues plugin enables simple approval for Redmine issues.

## Requirements

- Redmine >= 4.0.0

## Installation

To install Redmine Approve Issues plugin, download or clone this repository in
your Redmine installation plugins directory!

```sh
cd path/to/plugin/directory
git clone https://github.com/gtt-project/redmine_approve_issues.git
```

Then run

```sh
bundle install
bundle exec rake redmine:plugins:migrate
```

After restarting Redmine, you should be able to see the Redmine Chatwoot plugin
in the Plugins page.

More information on installing (and uninstalling) Redmine plugins can be found
in the [Redmine Plugin](https://www.redmine.org/wiki/redmine/Plugins) docs.

## How to use

The plugin configuration is available in Redmine's plugin list: `https://localhost:3000/admin/plugins`

1. Enable for a project
2. Enable permissions for (authenticated) roles
   1. "Approval on issues"
   2. "View approvals"
   3. "View approvers"

## Contributing and Support

The GTT Project appreciates any [contributions](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md)!
Feel free to contact us for [reporting problems and support](https://github.com/gtt-project/.github/blob/main/CONTRIBUTING.md).

## Version History

See [all releases](https://github.com/gtt-project/redmine_approve_issues/releases)
with release notes.

## Authors

- [Daniel Kastl](https://github.com/dkastl)
- ... [and others](https://github.com/gtt-project/redmine_approve_issues/graphs/contributors)

Many thanks to [Vote On Issues](https://github.com/ojde/redmine-vote_on_issues-plugin)
plugin, which this plugin adopted many good ideas and concepts from!

## LICENSE

This program is free software. See [LICENSE](LICENSE) for more information.
