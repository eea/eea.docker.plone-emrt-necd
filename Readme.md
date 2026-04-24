# EMRT NECD Plone Image

[![Docker]( https://dockerbuildbadges.quelltext.eu/status.svg?organization=eeacms&repository=plone-emrt-necd)](https://hub.docker.com/r/eeacms/plone-emrt-necd/builds)

## Installation and usage

This image now extends [`plone/plone-backend`](https://6.docs.plone.org/install/containers/images/backend.html#extending-from-this-image) and installs during image build:

- `emrt.necd.content==3.0.4`
- `emrt.necd.theme==3.0.0`
- `collective.deletepermission==2.0.0a3`
- `plone.formwidget.multifile` from https://github.com/david-batranu/plone.formwidget.multifile, installed in editable mode.

See [EMRT NECD Orchestration](https://github.com/eea/eea.docker.www-emrt-necd) for deployment usage.
