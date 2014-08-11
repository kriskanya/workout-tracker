RSpec.describe Workout do
  it { should belong_to :daily_routine }
  it { should validate_presence_of :name }
  it { should validate_presence_of :daily_routine }
end
