#Spectra
#### Server-side music management done right
[![Dependency Status](http://img.shields.io/gemnasium/spectra-music/spectra.svg?style=flat)](https://gemnasium.com/spectra-music/spectra)
[![Build Status](http://img.shields.io/travis/spectra-music/spectra/dev.svg?style=flat)](https://travis-ci.org/spectra-music/spectra)
[![Code Climate](https://img.shields.io/codeclimate/github/spectra-music/spectra.png?style=flat)](https://codeclimate.com/github/spectra-music/spectra)
[![Coverage](https://img.shields.io/codeclimate/coverage/github/spectra-music/spectra.png?style=flat)](https://codeclimate.com/github/spectra-music/spectra)

Spectra is a deployed music hosting system. It sits on your server or NAS, with access to your music files, and allows
easy transparent access to data and metadata. 

## Core ideals
- APIs should be clean, and RESTful.
- Music formats shouldn't matter, because it's just data.
- Decoding should be done at the most powerful location: the client
- Deployable anywhere, from a laptop to a large-scale NAS

## Installation

### Development
1. Install Ruby 2.1 and bundler.
2. `git clone https://github.com/spectra-music/spectra`
3. `cd spectra`
2. `bundle`
3. `rake db:setup`
4. `rails server`

### Production
[coming soon]

## Technologies
- Ruby 2.1
- Rails 4
- Slim
- SCSS
- CoffeeScript
- AngularJS
