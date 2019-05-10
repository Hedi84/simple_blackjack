class Interface
  def initialize(controller)
    @controller = controller
  end


  def run
    # loop do
      welcome
      @controller.start_game
    # end
  end

  private

  def welcome
    puts "================================================="
    puts "             Welcome to Blackjack!"
    puts "================================================="
  end


end
