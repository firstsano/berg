[travis]: https://travis-ci.org/icelab/berg
[code climate]: https://codeclimate.com/github/icelab/berg
[code climate coverage]: https://codeclimate.com/github/icelab/berg/coverage

# Berg

[![Build Status](https://travis-ci.org/icelab/berg.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/icelab/berg/badges/gpa.svg)][code climate]
[![Test Coverage](https://codeclimate.com/github/icelab/berg/badges/coverage.svg)][code climate coverage]

The new [icelab.com.au](http://icelab.com.au), built with with [dry-web](https://github.com/dry-rb/dry-web), [ROM](http://rom-rb.org/) and [Roda](http://roda.jeremyevans.net).

## Development

### First-time setup

If you're in Icelab and have access to the private berg-assets repository:

```sh
./bin/setup --with-private-assets
```

Otherwise:

```sh
./bin/setup
```

### Adding sample data
```sh
rake db:sample_data
```

### Running the app

```sh
foreman start -f Procfile.dev
```

### Assets

The public designs for this site are contained in a separate, private `berg-assets` repository. If you’re working on Berg within Icelab, you should have a copy of this repository checked out at `app/main/assets`. You can make changes within that directory and push them up as you would with any ordinary git repo.

To prepare the site to deploy with updated assets, get the latest commit from berg-assets and save it in `apps/main/.assets-commit`. For example, to save the most recent commit in your `apps/main/assets` working directory:

```sh
(pushd apps/main/assets; git rev-parse HEAD; popd) > apps/main/.assets-commit
```

### Sitemaps

The [sitemap_generator gem](https://github.com/kjvarga/sitemap_generator) is used to generate sitemaps.

To create the sitemap and upload it to S3:
`rake sitemap:create`

To refresh the sitemap and ping search engines:
`rake sitemap:refresh`

## Deployment

Deployment to Heroku requires the following buildpacks:

1. https://github.com/timshadel/heroku-buildpack-github-netrc
2. https://github.com/icelab/berg-buildpack
3. heroku/nodejs
4. heroku/ruby

A `GITHUB_AUTH_TOKEN` config must be set with a token that is authorized to clone the berg-assets repository.

`apps/main/.assets-commit` must exist with a valid commit SHA for the berg-assets repository.
