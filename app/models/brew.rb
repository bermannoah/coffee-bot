class Brew < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :team

  def self.handle_request(params)
    if params['command'] == '/kettle_brewing'
      Brew.create_new_kettle_brew(params)
    else
      Brew.create_new_brew(params)
    end
  end

  def self.brew_creator(team, params)
    text = params['text'].split(' ')
    location = text.shift || params['team_domain']
    brew = team.brews.create!(
      user_name: params['user_name'],
      location: location,
      description: text.join(' ')
    )
    brew
  end

  def self.create_new_brew(params)
    team = find_team(params)
    brew = brew_creator(team, params)
    send_webhook_alert(team, params) if team.webhook_url?
    brew.brewed_coffee_response(params)
  end

  def self.create_new_kettle_brew(params)
    team = find_team(params)
    brew = brew_creator(team, params)
    send_kettle_webhook_alert(team.webhook_url, params) if team.webhook_url?
    brew.brewed_kettle_response(params)
  end

  def brewed_coffee_response(_params)
    {
      "text": "Hey #{user_name} - thanks for brewing coffee! NOTE: This service will shut down on July 1 2020. Please email noah@noahberman.org with any questions. Thank you for all the brews, and be safe out there.",
    }
  end

  def brewed_kettle_response(_params)
    {
      "text": "Hey #{user_name} - thanks for starting the kettle! NOTE: This service will shut down on July 1 2020. Please email noah@noahberman.org with any questions. Thank you for all the brews, and be safe out there.",
    }
  end

  def make_brewed_coffee_response(_brew)
    {
      "text": 'Starting to brew coffee!'
    }
  end

  def self.get_last_brewed(params)
    limit = params['text'].to_i == 0 ? 1 : params['text'].to_i
    list = ''
    team = Team.find_by(team_slack_id: params['team_id'])
    if team.nil?
      Appsignal.increment_counter("request_with_no_team", 1)
      {text: "Sorry, please sign in with Slack to do this. https://coffeebot.coffee for instructions. :)"}
    else
      team.brews.order(created_at: :desc).limit(limit).each do |brew|
        time = ApplicationController.helpers.time_ago_in_words(brew.created_at)
        list << "Coffee was brewed in #{brew.location} #{time} ago. NOTE: This service will shut down on July 1 2020. Please email noah@noahberman.org with any questions. Thank you for all the brews, and be safe out there.\n"
        list << "#{brew.user_name} commented: #{brew.description}\n" if brew.description != ''
      end
      {
        "text": 'Last coffee brew(s):',
        "attachments": [
          {
            "text": list
          }
        ]
      }
    end
  end

  def self.find_team(params)
    Team.find_team_from_params(params)
  end

  def self.find_brew_by_team(current_user)
    slack_user = SlackLoginUser.find(current_user.id)
    team = Team.find(slack_user.team_id)
    where(team_id: team.id).order(created_at: :desc)
  end

  def self.index_brew_display(current_user)
    if current_user && retrieve_recent_brew(current_user)
      "Coffee was most recently brewed in #{@recent_brew.location} #{ApplicationController.helpers.time_ago_in_words(@recent_brew.created_at)} ago. NOTE: This service will shut down on July 1 2020. Please email noah@noahberman.org with any questions. Thank you for all the brews, and be safe out there."
    elsif current_user && !retrieve_recent_brew(current_user)
      'No coffee has been brewed yet. Use the commands below to start logging brews! NOTE: This service will shut down on July 1 2020. Please email noah@noahberman.org with any questions. Thank you for all the brews, and be safe out there.'
    end
  end

  def self.retrieve_recent_brew(current_user)
    if current_user.nil?
      false
    else
      @recent_brew = where(team_id: current_user.team_id).last
    end
  end

  def self.send_webhook_alert(team, params)
    webhook_url = team.webhook_url
    webhook_time = team.webhook_time || 5.0 # Minutes
    webhook_text = team.webhook_text || nil
    send_reminder = team.send_reminder
    WebhookService.coffee_is_brewing(webhook_url, webhook_time, webhook_text, send_reminder, params)
  end

  def self.send_kettle_webhook_alert(webhook_url, params)
    WebhookService.kettle_is_brewing(webhook_url, params)
  end
end
