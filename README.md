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

Just the bare-bones steps for now:

```
./bin/setup
```

### Running the app

```
foreman start -f Procfile.dev
```

### Assets

The design-specifics for this site are contained in a separate Icelab-specific `berg-assets` private repo.

### Sitemaps

The [sitemap_generator gem](https://github.com/kjvarga/sitemap_generator) is used to generate sitemaps.

To create the sitemap and upload it to S3:
`rake sitemap:create`

To refresh the sitemap and ping search engines:
`rake sitemap:refresh`
