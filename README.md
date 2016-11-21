# 418-Bot (known elsewhere as Coffee-Bot)

## I'm a coffee-pot slack-bot. 

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
