require_relative 'game'
require_relative 'view'

class Controller
  attr_accessor :player, :dealer, :player_score, :dealer_score, :game
  def initialize
    @game = Game.new
    @view = View.new
    @player = []
    @dealer = []
    @player_score = 0
    @dealer_score = 0
  end

  def start_game
    2.times do
      add_card_dealer
      add_card_player
    end
    check_dealer
    play_game
  end

  def play_game
    until @player_score >= 21 || @dealer_score >= 21
      @view.show_cards(@player_score, @player)
      answer = @view.ask_player
      if answer == "Y"
        add_card_player
      elsif answer == "N"
        break
      else
        puts "that is an incorrect answer, try again"
        @view.ask_player
      end
    end
    if @player_score > 21
      puts "===============Busted, you lose!==============="
    elsif dealer_score > 21
      puts "===============Dealer busted, you win!==============="
    elsif @player_score == @dealer_score
      puts "===============Draw!==============="
    elsif @player_score == 21
      puts "===============Blackjack, you win!==============="
    elsif @dealer_score == 21
      puts "===============Dealer has Blackjack, you lose!==============="
    elsif @player_score > @dealer_score
      puts "===============You win!==============="
    elsif @player_score < @dealer_score
      puts "===============You lose!==============="
    end
    @view.final_scores(@player_score, @dealer_score, @player, @dealers)
  end

  def add_card_player
    key_sample = @game.deck.keys.sample
    if card_drawn(key_sample)
      @player.push(key_sample)
      number = is_ace(key_sample).to_i
      @player_score += number
    else
      add_card_player
    end
  end

  def add_card_dealer
    key_sample = @game.deck.keys.sample
    if card_drawn(key_sample)
      @dealer.push(key_sample)
      number = is_ace_dealer(key_sample).to_i
      @dealer_score += number
    else
      add_card_dealer
    end
  end

  def check_dealer
    until @dealer_score >= 17
      add_card_dealer
    end
  end

  def is_ace(key)
    if @game.deck[key] == "ace"
      answer = @view.ask_player_ace
      if answer == "1"
        return 1
      elsif answer == "11"
        return 11
      else "That's not a valid number, try again"
        ask_player_ace
      end
    else
      return @game.deck[key]
    end
  end


  def is_ace_dealer(key)
    if @game.deck[key] == "ace"
      (@dealer_score <= 10) ?  11 : 1
    end
    return @game.deck[key]
  end

  def card_drawn(key)
    if (@player.include?(key)) || (@dealer.include?(key))
      return false
    else
      return true
    end
  end

end
