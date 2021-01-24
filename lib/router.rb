class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts 'Welcome to the Gift list!'
    puts '           --           '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list_all
    when 2 then @controller.create
    when 3 then @controller.etsy
    when 4 then @controller.destroy
    when 5 then stop
    else
      puts 'Please press 1, 2, 3 ,4 or 5'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - List all gifts'
    puts '2 - Add a new gift'
    puts '3 - search etsy list'
    puts '4 - Destroy a gift'
    puts '5 - Stop and exit the program'
  end
end
