class WorkoutsController
  def initialize(origin_daily_routine)
    @origin_daily_routine = origin_daily_routine
  end

  def list
    puts "=============="
    puts "#{@origin_daily_routine.name.upcase} WORKOUT"
    puts "=============="
    workouts.each_with_index do |workout, index|
      puts "#{index + 1}. #{workout.name}"
    end
    Router.navigate_workouts_menu(self)
  end

  def view(workout_number)
    workout = workouts[workout_number - 1]
    if workout
      puts "=============="
      puts "#{@origin_daily_routine}: #{workout.name}"
    else
      puts "Workout #{workout_number} doesn't exist."
    end
  end
end
