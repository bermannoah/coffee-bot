# coffeebot 

# THIS PROJECT IS NOW ARCHIVED AND READ-ONLY. IF YOU WISH TO USE THE BOT PLEASE FORK AND APPLY NECESSARY UPDATES.

# THANK YOU FOR BREWING <3

a coffee-pot slack-bot

[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu/#/en_US)

## How to use coffeebot
If you're not using coffeebot already you will need to to add the app to your Team. To do so you (or an admin) will also need to use the Add to Slack button on the coffee bot homepage. It will add these commands:

`/coffee_brewing` - a POST request to https://< coffeebot url>/api/v1/coffee_brewing

`/last_brewed` - a POST request to https://< coffeebot url >/api/v1/last_brewed

After this, everything should be running smoothly. Test it out by submitting a brew with `/coffee_brewing`.  Feel free to file a ticket on the repo if you run into any trouble. I'm not archiving the project yet but for all practical purposes it is no longer being _actively_ maintained.

### Technical details

Rails endpoints that interact with Slack slash commands and store data using PostgreSQL.  [
Views use the [Spectre](https://picturepan2.github.io/spectre/) CSS framework. The site is hosted on AWS EC2 with a HTTPS certificate provided by [Let's Encrypt](https://letsencrypt.org/). Error tracking and system monitoring provided by [Appsignal](https://appsignal.com).

### Basics of interacting with the bot
![gif of interaction](https://github.com/bermannoah/repo-images/blob/master/cb_basics.gif)
