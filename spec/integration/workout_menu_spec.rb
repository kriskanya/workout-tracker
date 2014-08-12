RSpec.describe "Viewing the workout menu;", :integration do
  let!(:routine1){ DailyRoutine.create(name: 'Tuesday') }
  let!(:routine2){ DailyRoutine.create(name: 'Wednesday') }

  context "a daily routine that is in the list" do
    let(:output){ run_wt_with_input('2') }  # selects Wednesday

    before do
      Workout.create(name: "Chest and Triceps", daily_routine: routine1)
      Workout.create(name: "Back and Biceps", daily_routine: routine2)
    end

    it "should include the name of the daily routine being viewed" do
      expect(output).to include("You have selected the Wednesday daily routine.")
    end
    it "should list the workouts in the daily routine" do
      expected = "1. Back and Biceps\n"
      expect(output).to include(expected)
    end
    it "shouldn't list the workouts in other daily routines" do
      expect(output).not_to include("Chest and Triceps")
    end
  end

  context "if we enter a daily routine that doesn't exist" do
    let(:output){ run_wt_with_input('4') }
    it "prints an error message" do
      expect(output).to include("The daily routine '4' doesn't exist.")
    end
  end

end
