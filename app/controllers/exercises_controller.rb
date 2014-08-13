class ExercisesController
  def initialize(origin_workout)
    @origin_workout = origin_workout
  end

  def add
    puts "Which #{@origin_workout.name} exercise do you want to add?"
    name = clean_gets
    puts "Write a brief description of the exercise."
    description = clean_gets
    puts "How much weight?"
    weight = clean_gets
    puts "How many reps?"
    reps = clean_gets
    puts "How many sets?"
    sets = clean_gets
    exercise = Exercise.create(name: name, description: description, weight: weight, reps: reps, sets: sets, workout: @origin_workout)

    if exercise.new_record?
      puts exercise.errors.full_messages
    else
      puts "#{name} has been added to the #{@origin_workout.name} workout.".red
    end
  end

  def list
    puts "=============="
    puts "#{@origin_workout.daily_routine.name.upcase}: #{@origin_workout.name.upcase} EXERCISES"
    puts "=============="

    exercises.each_with_index do |exercise, index|
      puts "#{index + 1}. #{exercise.name}"
      puts "Description: #{exercise.description}"
      puts "Weight: #{exercise.weight}"
      puts "Sets: #{exercise.sets}"
      puts "Reps: #{exercise.reps}"
      puts "=============="
    end
    puts "Type 'add' to add a new exercise."
    Router.navigate_exercises_menu(self)
  end

  def view(exercise_number)
    exercise = exercises[exercise_number - 1]
    if exercise
      puts "=============="
      puts "#{origin_workout.name}: #{exercise.name}"
    else
      puts "Exercise #{exercise_number} doesn't exist."
    end
  end

  private

  def exercises
    @exercises ||= @origin_workout.exercises
  end
end
