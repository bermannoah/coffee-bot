# coffeebot thinks github should immediately revoke its contract with ICE!

a coffee-pot slack-bot

[![Build Status](https://travis-ci.org/bermannoah/coffee-bot.svg?branch=master)](https://travis-ci.org/bermannoah/coffee-bot)
[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu/#/en_US)
![Mozilla HTTP Observatory Grade](https://img.shields.io/mozilla-observatory/grade/coffeebot.coffee?publish)
![Monitored by Appsignal](https://img.shields.io/badge/monitored%20by-Appsignal-green?link=https://appsignal.com)

## How to use coffeebot
If you're not using coffeebot already you will need to to add the app to your Team. To do so you (or an admin) will also need to use the Add to Slack button on the coffee bot homepage. It will add these commands:

`/coffee_brewing` - a POST request to https://coffeebot.coffee/api/v1/coffee_brewing

`/last_brewed` - a POST request to https://coffeebot.coffee/api/v1/last_brewed

You can also set up tooltips for the commands. I'd recommend using some variation of the descriptions on [the main site](https://coffeebot.coffee). Plus, you can give the command response 'bot' a name!

After this, everything should be running smoothly. Test it out by submitting a brew with `/coffee_brewing`.  Feel free to email me - hello at coffeebot.coffee - if you run into any trouble.

### Technical details

Rails endpoints that interact with Slack slash commands and store data using PostgreSQL.  [
Views use the [Spectre](https://picturepan2.github.io/spectre/) CSS framework. The site is hosted on AWS EC2 with a HTTPS certificate provided by [Let's Encrypt](https://letsencrypt.org/). Error tracking and system monitoring provided by [Appsignal](https://appsignal.com).

### Basics of interacting with the bot
![gif of interaction](https://github.com/bermannoah/repo-images/blob/master/cb_basics.gif)