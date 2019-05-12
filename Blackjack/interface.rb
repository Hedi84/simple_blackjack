class Interface
  def initialize(controller)
    @controller = controller
  end


  def run
      welcome
      @controller.start_game
  end

  private

  def welcome
    puts "================================================="
    puts "             Welcome to Blackjack!"
    puts "================================================="
  end


end
