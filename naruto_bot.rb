require 'json'
require 'discordrb'

module NarutoBot
  throw "Lacking required secrets!" unless ENV["TOKEN"]

  @bot = Discordrb::Bot.new token: ENV["TOKEN"]

  @ramen_count = 0

  @sleep_dur = 0.5
  @sleep_dur_long = 1

  words = ['believe','rollie', 'ranch', 'dab']

  be_sweet = ['dbz', 'one piece', 'attack on titan', 'berserk', 'dragon ball', 'aot', 'cowboy bebop']

  play_fortnite = [
    'you should go fishing',
    'make sure you don\'t build',
    'don\'t forget to thank the bus driver'
  ]

  song ="We got a number one Victory Royale 
Yeah, Fortnite, we 'bout to get down (get down)
Ten kills on the board right now
Just wiped out Tomato Town
My friend just got downed
I revived him, now we're heading south-bound
Now we're in the Pleasant Park streets
Look at the map, go to the marked sheet
Take me to your Xbox to play Fortnite today
You can take me to Moisty Mire, but not Loot Lake
I really love to Chug Jug with you
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
    song.split("\n").each { |line|  
      sleep @sleep_dur_long 
      event.respond line
    }
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
    if event.message.author.username == 'Nikki'
      event.respond 'Stinky mode online'
      event.respond 'what\'s the baby boi doing?'
      event.user.await!(timeout: 10) do |message|
        if message.content == 'sleepin'
          event.respond 'so cute. I hope he has a good rest. believe it'
        elsif message.content == 'stinkin'
          event.respond 'he\'s always stinkin. so cute. believe it'
        else
          event.respond 'he\'s such a good boy. believe it'
        end
      end
      event.respond 'Stinky mode offline'
    else
      event.respond stinky.sample
    end
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

  @bot.mention(in: 'naruto-bot-requests') do |event|
    request = event.message.content.split(' ')[1..-1].join(' ')
    sleep @sleep_dur
    event.respond 'request-confirmed.'
    event.respond "#{request} sounds like a great idea!"
    # need to give naruto permissions
    # event.message.pin
    event.respond 'believe it.'
  end
    



  def self.run
    @bot.run
  end
end