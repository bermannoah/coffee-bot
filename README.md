# 418-Bot (though it mainly goes by Coffee-Bot)

## I'm a coffee-pot slack-bot. 

## How to use the Coffee-Bot
All you should need to do is go to the [site](https://coffeebot.coffee) and login via Slack. If your team is already using Coffee-Bot, then that should be it. If not, you will likely need to to add the app to your Team as part of the login process. Depending on your Slack team's settings (and your level of access to the system) you may need an admin to add two slash commands:

`/coffee_brewing` - a POST request to https://coffeebot.coffee/api/v1/coffee_brewing

`/last_brewed` - a GET request to https://coffeebot.coffee/api/v1/coffee_brewing

(Both URLs are the same, though the request type is different.)

After this, everything should be running smoothly. Feel free to email me - noah at noahberman dot org - if you run into any trouble.

### Technical details

Rails endpoints that interact with Slack slash commands and store data using PostgreSQL. Login on view pages
handled by a Slack oauth setup leveraging [Figaro](https://github.com/laserlemon/figaro) and [Faraday](https://github.com/lostisland/faraday). Multi-tenancy provided by [Apartment](https://github.com/influitive/apartment).
View pages use the [Spectre](https://picturepan2.github.io/spectre/) CSS framework. The site is hosted on a
[Digital Ocean](https://www.digitalocean.com/) droplet with a HTTPS certificate provided by the extremely great [Let's Encrypt](https://letsencrypt.org/).

[![Code Climate](https://codeclimate.com/github/bermannoah/418-bot/badges/gpa.svg)](https://codeclimate.com/github/bermannoah/418-bot)

### Basics of interacting with the bot
![gif of interaction](https://github.com/bermannoah/418-bot/blob/master/basics.gif)

### A view page
![view of this iteration of the site](https://github.com/bermannoah/418-bot/blob/master/coffee_pot_screen_shot.jpg)

### TODO: 
 - complete test suite!
 - make coffee bot actually be able to make coffee!
 - tenant admin system for custom How-To pages and the #out of coffee function
 - interactive button options on slack commands
