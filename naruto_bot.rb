require 'json'
require 'discordrb'

module NarutoBot
  throw "Lacking required secrets!" unless ENV["TOKEN"]

  @bot = Discordrb::Bot.new token: ENV["TOKEN"]

  @ramen_count = 0

  @sleep_dur = 0.25

  words = ['believe','rollie', 'ranch', 'dab']

  be_sweet = ['dbz', 'one piece', 'attack on titan', 'berserk', 'dragon ball', 'aot', 'cowboy bebop']

  play_fortnite = [
    'you should go fishing',
    'make sure you don\'t build',
    'don\'t forget to thank the bus driver'
  ]

  song ="We got a number one Victory Royale\n 
  Yeah, Fortnite, we 'bout to get down (get down)\n
  Ten kills on the board right now\n
  Just wiped out Tomato Town\n
  My friend just got downed\n
  I revived him, now we're heading south-bound\n
  Now we're in the Pleasant Park streets\n
  Look at the map, go to the marked sheet\n
  Take me to your Xbox to play Fortnite today\n
  You can take me to Moisty Mire, but not Loot Lake\n
  I really love to Chug Jug with you\n
  We can be pro Fortnite gamers"

  stinky = [
    'i wonder what he is doing',
    'hope he is having a good day',
  ]

  @bot.message(with_text: 'hi naruto') do |event|
    sleep @sleep_dur
    event.respond 'ohayo'
  end

  @bot.message(with_text: '!ramen') do |event|
    @ramen_count += 1
    event.respond "I've eaten #{@ramen_count} bowls of ramen. believe it"
  end

  @bot.message(with_text: '!song') do |event|
    event.respond song
  end

  @bot.message(with_text: 'bye naruto') do |event|
    sleep @sleep_dur
    event.respond 'byeharo'
  end

  @bot.message(with_text: 'ty naruto') do |event|
    sleep @sleep_dur
    event.respond 'welcome'
  end

  @bot.message(with_text: '!stinky') do |event|
    sleep @sleep_dur
    event.respond 'lil baby boi'
    event.respond stinky.sample
  end   

  @bot.message(content: words) do |event|
    sleep @sleep_dur
    event.respond 'believe it'
  end

  @bot.message(content: be_sweet) do |event|
    sleep @sleep_dur
    event.respond "i'm like right here. be sweet to me. believe it"
  end

  @bot.message(with_text: '!fortnite') do |event|
    sleep @sleep_dur
    event.respond play_fortnite.sample
  end

  def self.run
    @bot.run
  end
end