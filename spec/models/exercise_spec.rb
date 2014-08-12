RSpec.describe Exercise do
  it { should belong_to :workout }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :weight }
  it { should validate_presence_of :reps }
  it { should validate_presence_of :sets }
end
