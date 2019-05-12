require_relative 'controller'

class View
  def initialize
  end

  def show_cards(score, array)
    puts "Your total score is #{score.to_s}"
    puts "You have #{array.length} cards:"
    array.each do |card|
      puts "- #{card.to_s}"
    end
  end

  def ask_player
    puts "would you like another card?"
    puts "Enter 'y' for yes or 'n' for now"
    answer = gets.chomp.capitalize
    return answer
  end

  def final_scores(player_score, dealer_score, array, array2)
    puts "Your total score is #{player_score.to_s}"
    puts "You have #{array.length} cards:"
    array.each do |card|
      puts "- #{card.to_s}"
    end
    puts "The dealer's total score is #{dealer_score.to_s}"
    puts "They have #{array.length} cards:"
    array2.each do |card|
      puts "- #{card.to_s}"
    end
  end

  def ask_player_ace(score, player)
    show_cards(score, player)
    puts "you've received an ace, enter '1' to let it count for one point or '11' for 11 points."
    answer = gets.chomp
    return answer
  end
end
