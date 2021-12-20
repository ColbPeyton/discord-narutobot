require 'json'
require 'discordrb'

module NarutoBot
  throw "Lacking required secrets!" unless ENV["TOKEN"]

  @bot = Discordrb::Bot.new token: ENV["TOKEN"]

  @ramen_count = 0

  @sleep_dur = 0.25

  words = ['believe','rollie', 'ranch', 'dab', 'fortnite']

  be_nice = ['dbz', 'one piece', 'attack on titan', 'berserk', 'dragon ball', 'aot', 'cowboy bebop']

  @bot.message(with_text: 'hi naruto') do |event|
    sleep @sleep_dur
    event.respond 'ohayo'
  end
  @bot.message(containing: words) do |event|
    sleep @sleep_dur
    event.respond 'believe it'
  end

  @bot.message(containing: be_nice) do |event|
    sleep @sleep_dur
    event.respond "i'm like right here. be nice to me"
  end

  @bot.message(with_text: '!ramen') do |event|
    @ramen_count += 1
    event.respond "I've eaten #{@ramen_count} bowls of ramen. believe it"
  end

  @bot.message(with_text: 'bye naruto') do |event|
    sleep @sleep_dur
    event.respond 'byeharo'
  end

  @bot.message(with_text: 'ty naruto') do |event|
    sleep @sleep_dur
    event.respond 'welcome'
  end

  def self.run
    @bot.run
  end
end