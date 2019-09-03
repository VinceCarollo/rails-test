describe 'As a user creating a task' do
  it "can add a due date" do
    list = List.create!(title: 'list1')

    visit new_list_task_path(list)

    fill_in :task_name, with: 'Groceries'
    fill_in :task_due_date, with: '01/01/2020'

    click_button "Create Task"

    task = Task.last

    expect(task.due_date).to eq(DateTime.new(2020, 1, 1))
  end
end
