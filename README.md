# Spectra 
#### Server-side music management done right
[![License](https://img.shields.io/badge/license-MIT-red.svg?style=flat-square)]()
[![Gitter](http://img.shields.io/badge/gitter-spectra-orange.svg?style=flat-square)](https://gitter.im/spectra-music/spectra)
[![](https://img.shields.io/github/issues-raw/spectra-music/spectra.svg?style=flat-square)](https://github.com/spectra-music/spectra/issues)
[![Code Climate](https://img.shields.io/codeclimate/github/spectra-music/spectra.svg?style=flat-square)](https://codeclimate.com/github/spectra-music/spectra)
[![Coverage](https://img.shields.io/codeclimate/coverage/github/spectra-music/spectra.svg?style=flat-square)](https://codeclimate.com/github/spectra-music/spectra)
[![Build Status](http://img.shields.io/travis/spectra-music/spectra/dev.svg?style=flat-square)](https://travis-ci.org/spectra-music/spectra)
[![Dependency Status](http://img.shields.io/gemnasium/spectra-music/spectra.svg?style=flat-square)](https://gemnasium.com/spectra-music/spectra)
[![version](https://img.shields.io/badge/version-0.0.1-blue.svg?style=flat-square)]()  
Spectra is a deployed music hosting system. It sits on your server or NAS, with access to your music files, and allows easy transparent access to data and metadata. 

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
