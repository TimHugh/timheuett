# TimHeuett.com

[ ![Codeship Status for TimHugh/timheuett](https://codeship.com/projects/6c4cfe20-ce5f-0132-dc37-662c162fdcda/status?branch=master)](https://codeship.com/projects/76432)
[![Code Climate](https://codeclimate.com/github/TimHugh/timheuett/badges/gpa.svg)](https://codeclimate.com/github/TimHugh/timheuett)
[![Test Coverage](https://codeclimate.com/github/TimHugh/timheuett/badges/coverage.svg)](https://codeclimate.com/github/TimHugh/timheuett)

## Intro

This is the source for my personal website, at [TimHeuett.com](http://www.timheuett.com).

Built on Sinatra, with a Sprockets-powered asset pipeline, and other stuff like SLIM templates and SASS.

## Usage

The port and environment need to be set in a `.env` file in the project root:

    PORT=3000
    RACK_ENV=development

Then, just `bundle` and `bundle exec foreman start`
