RSpec.describe "adding exercises to a workout", :integration do
  let!(:daily_routine1){ DailyRoutine.create(name: "Tuesday") }
  let!(:workout1){ Workout.create(name: "Chest and Triceps", daily_routine: daily_routine1) }
  # let!(:exercise1){ Exercise.create(name: "Tricep Pushdown", description: "Push down", weight: "100", reps: "12", sets: "4") }
  let!(:output){ run_wt_with_input("1", "1", "add", "Tricep Pushdown", "Push down from your sternum to full extension", "100", "12", "4") }

  it "prints a success message" do
    "Tricep Pushdown has been added to the Chest and Tricep workout."
  end

  it "saves the exercise to the correct workout" do
    expect(Exercise.last.workout_id).to eq workout1.id
  end

  it "saves the workout name" do
    expect(Exercise.last.name).to eq "Tricep Pushdown"
  end

  context "invalid input" do
    let!(:daily_routine1){ DailyRoutine.create(name: "Tuesday") }
    let!(:workout1){ Workout.create(name: "Chest and Triceps", daily_routine: daily_routine1) }
    let!(:output){ run_wt_with_input("1", "1", "add", "", "Push down from your sternum to full extension", "100", "12", "") }

    it "prints an error message: sets" do
      expect(output).to include "Sets can't be blank"
    end

    it "prints an error message: name" do
      expect(output).to include "Name can't be blank"
    end

    it "doesn't create a record" do
      expect(Exercise.count).to eq 0
    end
  end
end
