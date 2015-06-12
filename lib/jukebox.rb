require 'pry'
class Jukebox

  def initialize(songs)
    @songs = songs
  end


  def songs
    @songs
  end


  def help
    puts "I accept the following commands"
    puts "- help : displays this help message"
    puts "- list : displays a list of songs you can play"
    puts "- play : lets you choose a song to play"
    puts "- exit : exits this program"
  end
  def list
      counter = 0
    @songs.each do |song|
      puts "#{counter+1}. #{song}"
      counter += 1
    end
  end

  def play(user_input="")

    if user_input == ""
    puts "please enter a song number to play"
    user_input = gets.strip
    puts "Now Playing: #{@songs[user_input.to_i-1]}"
    elsif user_input.to_i.to_s == user_input
      puts "Now Playing: #{@songs[user_input.to_i-1]}"
    else
      @songs.each do |song|
        if user_input == song
          puts "Now Playing: #{song}"
        end
      end
    end
  end


  def call
    puts "please enter a command"
    user_input = gets.strip
    if user_input == "exit"
    else
      case user_input
        when "help"
          help
          
        when "list"
          list
          
        when "play"
          play_user_input = gets.strip
          if user_input.to_i.to_s == user_input
            play(play_user_input.to_i)
          else
            play(play_user_input)
          end
        when /play.+/
          input = user_input.split("play ")
          play(input[1])        
      end
    end
  end

end