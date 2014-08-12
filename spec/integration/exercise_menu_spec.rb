RSpec.describe "Viewing the exercise menu", :integration do
  let!(:routine1){ DailyRoutine.create(name: "Tuesday") }
  let!(:workout1){ Workout.create(name: "Chest and Triceps", daily_routine: routine1)}
  let!(:workout2){ Workout.create(name: "Back and Biceps", daily_routine: routine1)}

  context "a workout that is in the list" do
    let(:output){ run_wt_with_input('1', '2') }

    before do
      Exercise.create(name: "Bench Press", weight: 180, reps: 12, sets: 4, description: "Move the bar off your chest.", workout: workout1)
      Exercise.create(name: "Pulldown", weight: 90, reps: 12, sets: 4, description: "From a hang, pull the bar to your chest.", workout: workout2)
    end

    it "should include the name of the workout being viewed" do
      expect(output).to include("You have selected the Back and Biceps workout.")
    end
    it "should list the exercises in the workout" do
      expect(output).to include("1. Pulldown\n")
    end
  end
end
