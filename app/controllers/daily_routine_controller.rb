class DailyRoutineController

  def list  #lists out all of the daily routines
    # puts "=============="
    # puts "WORKOUT TRACKER"
    # puts "=============="
    workout_string = %q{
@@@  @@@  @@@  @@@@@@  @@@@@@@  @@@  @@@  @@@@@@  @@@  @@@ @@@@@@@   @@@@@@@ @@@@@@@   @@@@@@   @@@@@@@ @@@  @@@ @@@@@@@@ @@@@@@@
@@@  @@@  @@@ @@@@@@@@ @@@@@@@@ @@@  @@@ @@@@@@@@ @@@  @@@ @@@@@@@   @@@@@@@ @@@@@@@@ @@@@@@@@ @@@@@@@@ @@@  @@@ @@@@@@@@ @@@@@@@@
@@!  @@!  @@! @@!  @@@ @@!  @@@ @@!  !@@ @@!  @@@ @@!  @@@   @@!       @@!   @@!  @@@ @@!  @@@ !@@      @@!  !@@ @@!      @@!  @@@
!@!  !@!  !@! !@!  @!@ !@!  @!@ !@!  @!! !@!  @!@ !@!  @!@   !@!       !@!   !@!  @!@ !@!  @!@ !@!      !@!  @!! !@!      !@!  @!@
@!!  !!@  @!@ @!@  !@! @!@!!@!  @!@@!@!  @!@  !@! @!@  !@!   @!!       @!!   @!@!!@!  @!@!@!@! !@!      @!@@!@!  @!!!:!   @!@!!@!
!@!  !!!  !@! !@!  !!! !!@!@!   !!@!!!   !@!  !!! !@!  !!!   !!!       !!!   !!@!@!   !!!@!!!! !!!      !!@!!!   !!!!!:   !!@!@!
!!:  !!:  !!: !!:  !!! !!: :!!  !!: :!!  !!:  !!! !!:  !!!   !!:       !!:   !!: :!!  !!:  !!! :!!      !!: :!!  !!:      !!: :!!
:!:  :!:  :!: :!:  !:! :!:  !:! :!:  !:! :!:  !:! :!:  !:!   :!:       :!:   :!:  !:! :!:  !:! :!:      :!:  !:! :!:      :!:  !:!
 :::: :: :::  ::::: :: ::   :::  ::  ::: ::::: :: ::::: ::    ::        ::   ::   ::: ::   :::  ::: :::  ::  :::  :: :::: ::   :::
  :: :  : :    : :  :   :   : :  :   :::  : :  :   : :  :     :         :     :   : :  :   : :  :: :: :  :   ::: : :: ::   :   : :

    }
    puts workout_string

    daily_routines.each_with_index do |daily_routine, index|
      puts "#{index + 1}. #{daily_routine.name}"
    end
    puts "Select a daily routine by # or type 'add' to add a new one."

    Router.navigate_daily_routine_menu(self)
  end

  def add
    puts "What daily routine do you want to add?"
    name = clean_gets
    daily_routine = DailyRoutine.create(name: name)
    if daily_routine.new_record?
      # new_record? returns true if this object hasn't been saved yet
      puts daily_routine.errors.full_messages
    else
      puts "#{name} has been added to the daily routines.".red
    end
  end

  def view(daily_routine_number)
    daily_routine = daily_routines[daily_routine_number - 1]
    if daily_routine
      puts "You have selected the #{daily_routine.name} daily routine.".red
      workouts_controller = WorkoutsController.new(daily_routine)
      workouts_controller.list
    else
      puts "The daily routine '#{daily_routine_number}' doesn't exist.".red
    end
  end

  private

  def daily_routines
    @daily_routines ||= DailyRoutine.all
  end
end
