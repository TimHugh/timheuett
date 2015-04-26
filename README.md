# TimHeuett.com

[ ![Codeship Status for TimHugh/timheuett](https://codeship.com/projects/6c4cfe20-ce5f-0132-dc37-662c162fdcda/status?branch=master)](https://codeship.com/projects/76432)
[![Code Climate](https://codeclimate.com/github/TimHugh/timheuett/badges/gpa.svg)](https://codeclimate.com/github/TimHugh/timheuett)
[![Test Coverage](https://codeclimate.com/github/TimHugh/timheuett/badges/coverage.svg)](https://codeclimate.com/github/TimHugh/timheuett)

## Intro

This is the source for my personal website, at [TimHeuett.com](http://www.timheuett.com).

It is still in early development stage, and has mostly been a chance to play with some new tools.

The backend is written in Ruby using the Sinatra framework, and is hosted on Heroku. Initially, it was hosted on Bluehost.com using [FastCGI](http://www.fastcgi.com/) to launch a server instance, but the page load time was horrendous.

## Usage

If you are learning to use some of the tools I've played with, feel free to clone this repository to try them out. I use [Bundler](http://bundler.io/) to manage gem dependencies, and [Foreman](http://ddollar.github.io/foreman/) to launch the server, so startup is simple.

Be sure to set the PORT and RACK_ENV variables in your environment. I just keep these in my bash profile:

> export PORT=3000
>
> export RACK_ENV=development

Then it's as simple as `bundle` and `foreman start`

## Contributing

As a perpetual student, I would love to hear any criticisms of my approach or technique, as well as style/best practice recommendations. Since this is my personal website, and a vehicle for my education, I won't approve any pull requests, but feel free to fork and modify to your heart's content.
