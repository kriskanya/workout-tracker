RSpec.describe "Adding workouts to a daily routine", :integration do
  context "valid input" do
    let!(:daily_routine1){ DailyRoutine.create(name: "Tuesday") }
    let!(:daily_routine2){ DailyRoutine.create(name: "Wednesday" ) }
    let!(:output){ run_wt_with_input("2", "add", "Chest and Triceps") }

    it "prints a success message" do
      expect(output).to include("Chest and Triceps has been added to the Wednesday daily routine.")
    end

    it "saves the correct daily routine to the record" do
      expect(Workout.last.daily_routine_id).to eq daily_routine2.id
    end

    it "saves the workout name" do
      expect(Workout.last.name).to eq "Chest and Triceps"
    end
  end

  context "invalid input" do
    let!(:daily_routine){ DailyRoutine.create(name: "Monday") }
    let!(:output){ run_wt_with_input("1", "add", "") }

    it "prints an error message" do
      expect(output).to include("Name can't be blank")
    end

    it "doesn't create a workout" do
      expect(Workout.count).to eq 0
    end
  end
end
