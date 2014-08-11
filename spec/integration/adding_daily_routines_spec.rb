RSpec.describe "Adding daily routines", :integration do
  context "valid input" do
    let!(:output){ run_wt_with_input("add", "Monday") }

    it "should add a daily routine" do
      expect(DailyRoutine.count).to eql 1
    end
    it "should save the record accurately" do
      expect(DailyRoutine.last.name).to eql "Monday"
    end
    it "should print a success message" do
      expect(output).to include("Monday has been added to the daily routines.")
    end
  end
  context "invalid input" do
    let(:long_string){ "cat" * 14 }
    let!(:output){ run_wt_with_input("add", long_string) }

    it "prints the error message for the type of invalid input" do
      expect(output).to include("Name must be less than 30 characters")
    end
    it "shouldn't save the new record" do
      expect(DailyRoutine.count).to eql 0
    end
  end
end
