class Router
  def self.navigate_workouts_menu(workouts_controller)
    command = clean_gets
    case command
    when "add"
      workouts_controller.add
    when /\d+/
      workouts_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_daily_routine_menu(daily_routine_controller)
    command = clean_gets

    case command
    when "add"
      daily_routine_controller.add
    when /\d+/
      daily_routine_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
