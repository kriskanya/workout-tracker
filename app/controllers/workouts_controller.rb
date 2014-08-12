class WorkoutsController
  def initialize(origin_daily_routine)
    @origin_daily_routine = origin_daily_routine
  end

  def add
    puts "Which #{@origin_daily_routine.name} workout do you want to add?"
    name = clean_gets
    workout = Workout.create(name: name, daily_routine: @origin_daily_routine)
      # new_record? returns true if this object hasn't been saved yet
    if workout.new_record?
      puts workout.errors.full_messages
    else
      puts "#{name} has been added to the #{@origin_daily_routine.name} daily routine."
    end
  end

  def list
    puts "=============="
    puts "#{@origin_daily_routine.name.upcase} WORKOUT"
    puts "=============="
    workouts.each_with_index do |workout, index|  # see the private method for 'workouts'
      puts "#{index + 1}. #{workout.name}"
    end
    Router.navigate_workouts_menu(self)
  end

  def view(workout_number)
    workout = workouts[workout_number - 1]
    if workout
      puts "You have selected the #{workout.name} workout."
      exercises_controller = ExercisesController.new(workout)
      exercises_controller.list
    else
      puts "Workout #{workout_number} doesn't exist."
    end
  end

  private

  def workouts
    @workouts ||= @origin_daily_routine.workouts
  end
end
