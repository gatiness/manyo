require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a task_name, task_description" do
    task = Task.new
      task_name 'Manyo Step 1'
      task_description 'Learn rspec'
    expect(task). to be_valid
  end
it "is invalid without a task_name"
it "is invalid with task_name of more than 25 or more characters"
end 