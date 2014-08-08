class DailyRoutineController

  def list  #lists out all of the daily routines
    puts "=============="
    puts "WORKOUT TRACKER"
    puts "=============="

    Router.navigate_daily_routine_menu(self)
  end
end
