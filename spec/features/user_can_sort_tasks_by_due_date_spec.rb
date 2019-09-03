require 'spec_helper'

RSpec.describe 'as a user viewing tasks' do
  it "can sort all tasks by due date" do
    list = List.create!(title: 'list1')
    task1 = Task.create!(name: 'task1', complete: false, list: list, due_date: Time.now + 3.days)
    task2 = Task.create!(name: 'task2', complete: false, list: list, due_date: Time.now + 2.days)
    task3 = Task.create!(name: 'task3', complete: false, list: list, due_date: Time.now + 1.days)

    visit list_tasks_path(list)

    click_link "Sort By Due Date"

    expect(page.all('.task-name')[0]).to have_content(task3.name)
    expect(page.all('.task-name')[1]).to have_content(task2.name)
    expect(page.all('.task-name')[2]).to have_content(task1.name)
  end
end
