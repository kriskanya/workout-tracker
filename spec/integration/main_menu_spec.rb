RSpec.describe "WT Main Menu", :integration do
  context "Prints a menu" do
    it "shows the name of the app, 'Workout Tracker'" do
      actual = run_wt_with_input()
      expected =
      "=============="
      "WORKOUT TRACKER"
      "=============="
      expect(actual).to include(expected)
    end

    context "when we type an incorrect command" do
      let(:output){ run_wt_with_input('remove') }
      it "prints an informative message" do
        expect(output).to include("I don't know the 'remove' command")
      end
    end

    it "should print the list of daily routines" do
      DailyRoutine.create(name: "Monday")
      DailyRoutine.create(name: "Tuesday")
      DailyRoutine.create(name: "Wednesday")
      actual = run_wt_with_input()
      expected = "1. Monday\n"
                 "2. Tuesday\n"
                 "3. Wednesday\n"
      expect(actual).to include(expected)
    end
  end
end
