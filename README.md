# coffeebot

a coffee-pot slack-bot 

[![Dependency Status](https://gemnasium.com/badges/github.com/bermannoah/coffee-bot.svg)](https://gemnasium.com/github.com/bermannoah/coffee-bot)
[![Build Status](https://travis-ci.org/bermannoah/coffee-bot.svg?branch=master)](https://travis-ci.org/bermannoah/coffee-bot)

## How to use coffeebot
If you're not using coffeebot already you will need to to add the app to your Team. To do so you (or an admin) will also need to add two or three slash commands:

`/coffee_brewing` - a POST request to https://coffeebot.coffee/api/v1/coffee_brewing

`/last_brewed` - a GET request to https://coffeebot.coffee/api/v1/coffee_brewing

Optional: `/kettle_brewing` - a POST request to https://coffeebot.coffee/api/v1/kettle_brewing

You can also set up tooltips for the commands. I'd recommend using some variation of the descriptions on [the main site](https://coffeebot.coffee). Plus, you can give the command response 'bot' a name!

After this, everything should be running smoothly. Test it out by submitting a brew with `/coffee_brewing`.  Feel free to email me - noah at noahberman dot org - if you run into any trouble.

### Technical details

Rails endpoints that interact with Slack slash commands and store data using PostgreSQL.  [
View pages use the [Spectre](https://picturepan2.github.io/spectre/) CSS framework. The site is hosted on AWS EC2 with a HTTPS certificate provided by the extremely great [Let's Encrypt](https://letsencrypt.org/).

(If you're here for Coffee-Maker-Bot, click [here](https://github.com/bermannoah/coffee-maker-bot).)

### Basics of interacting with the bot
![gif of interaction](https://github.com/bermannoah/repo-images/blob/master/cb_basics.gif)