class Game
attr_accessor :deck

  def initialize
    @deck = {}
    array = ["Hearts", "Diamonds", "Clubs", "Spades"]
    numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10]
    array.each do |card|
      @deck["King of #{card}"] = 10
      @deck["Queen of #{card}"] = 10
      @deck["Jack of #{card}"] = 10
      @deck["Ace of #{card}"] = "ace"
      numbers.each do |number|
        @deck["#{number.to_s} of #{card}"] = number.to_s
      end
    end
  end

end
