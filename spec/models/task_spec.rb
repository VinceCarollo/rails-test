require 'spec_helper'

describe Task do
  context "(empty)" do
    subject { Task.new }
    it "should not be valid" do
      expect(subject.valid?).to be_false
    end
  end

  context "instance methods" do
    it ".sort_by_due_date" do
      list = List.create!(title: 'list1')
      task1 = Task.create!(name: 'task1', complete: false, list: list, due_date: Time.now + 3.days)
      task2 = Task.create!(name: 'task2', complete: false, list: list, due_date: Time.now + 2.days)
      task3 = Task.create!(name: 'task3', complete: false, list: list, due_date: Time.now + 1.days)

      expect(Task.sort_by_due_date).to eq([task3, task2, task1])
    end
  end
end
