require 'json'
require 'discordrb'

module NarutoBot
  throw "Lacking required secrets!" unless ENV["TOKEN"]

  @bot = Discordrb::Bot.new token: ENV["TOKEN"]

  words = ['believe','naruto', 'rollie', 'ranch', 'dab']

  @bot.message(containing: words) do |event|
    event.respond 'believe it'
  end

  def self.run
    @bot.run
  end
end