describe 'As a user' do
  describe 'creating a task' do
    it "can add a due date" do
      list = List.create!(title: 'list1')

      visit new_list_task_path(list)

      fill_in :task_name, with: 'Groceries'
      fill_in :task_due_date, with: '01/01/2020'

      click_button "Submit Task"

      task = Task.last

      expect(task.due_date).to eq(DateTime.new(2020, 1, 1))
    end
  end

  describe 'editing a task' do
    it "can update a tasks due date" do
      list = List.create!(title: 'list1')
      task = Task.create!(name: 'Groceries', complete: false, list: list, due_date: Time.now + 3.days )
      visit edit_list_task_path(list, task)

      fill_in :task_name, with: 'Groceries'
      fill_in :task_due_date, with: '01/01/2020'

      click_button "Submit Task"

      task = Task.last

      expect(task.due_date).to eq(DateTime.new(2020, 1, 1))
    end
  end
end
