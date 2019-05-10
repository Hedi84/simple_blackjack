require_relative 'controller'
require_relative 'interface'
require_relative 'view'

controller = Controller.new
interface = Interface.new(controller)
interface.run
