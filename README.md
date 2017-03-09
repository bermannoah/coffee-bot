# Coffee-Bot

## I'm a coffee-pot slack-bot. 

## How to use the Coffee-Bot
All you should need to do is go to the [site](https://coffeebot.coffee) and login via Slack. If your team is already using Coffee-Bot, then that should be it. If not, you will likely need to to add the app to your Team as part of the login process. You (or an admin) will also need to add two slash commands:

`/coffee_brewing` - a POST request to https://coffeebot.coffee/api/v1/coffee_brewing

`/last_brewed` - a GET request to https://coffeebot.coffee/api/v1/coffee_brewing

(Both URLs are the same, though the request type is different.)

You can also set up tooltips for the commands. I'd recommend using some variation of the descriptions on [the main site](https://coffeebot.coffee). Plus, you can give the command response 'bot' a name!

After this, everything should be running smoothly. Test it out by submitting a brew with `/coffee_brewing`.  Feel free to email me - noah at noahberman dot org - if you run into any trouble.

### Technical details
[![Code Climate](https://codeclimate.com/github/bermannoah/coffee-bot/badges/gpa.svg)](https://codeclimate.com/github/bermannoah/coffee-bot) [![Test Coverage](https://codeclimate.com/github/bermannoah/coffee-bot/badges/coverage.svg)](https://codeclimate.com/github/bermannoah/coffee-bot/coverage) [![security](https://hakiri.io/github/bermannoah/coffee-bot/master.svg)](https://hakiri.io/github/bermannoah/coffee-bot/master)

Rails endpoints that interact with Slack slash commands and store data using PostgreSQL. Login on view pages
handled by a Slack oauth setup leveraging [Figaro](https://github.com/laserlemon/figaro) and [Faraday](https://github.com/lostisland/faraday). Multi-tenancy provided by [Apartment](https://github.com/influitive/apartment).
View pages use the [Spectre](https://picturepan2.github.io/spectre/) CSS framework. The site is hosted on a
[Digital Ocean](https://www.digitalocean.com/) droplet with a HTTPS certificate provided by the extremely great [Let's Encrypt](https://letsencrypt.org/).


### Basics of interacting with the bot
![gif of interaction](https://github.com/bermannoah/repo-images/blob/master/cb_basics.gif)

### Logged out
![view of the index page pre login](https://github.com/bermannoah/repo-images/blob/master/cb_logged_out.jpg)

### Logged in
![view of the index page logged in](https://github.com/bermannoah/repo-images/blob/master/cb_logged_in.jpg)

### Logged in, viewing list of brews
![view of the list of brews while logged in](https://github.com/bermannoah/repo-images/blob/master/cb_list_of_brews.jpg)

### Coming soon: 
 - tenant admin system for custom How-To pages and the #out of coffee function
