require 'spec_helper'

describe ListsController do
  context 'responding to json' do
    it "gets all lists" do
      list1 = List.create!(title: 'list1 title')
      list2 = List.create!(title: 'list2 title')

      get :index, { :format => 'json' }

      expect(response).to be_successful

      lists = JSON.parse(response.body)

      expect(lists).to be_a Array

      expect(lists.first['title']).to eq('list1 title')
      expect(lists.last['title']).to eq('list2 title')
    end

    it "gets one list" do
      list = List.create!(title: 'list title')

      get :show, { :format => 'json', :id => list.id }

      expect(response).to be_successful

      list = JSON.parse(response.body)

      expect(list['title']).to eq('list title')
    end

    it "creates a list" do
      list = {
        "title" => "Groceries"
      }

      get :create, { :format => 'json', :list => list }

      expect(response).to be_successful

      list_data = JSON.parse(response.body)
      new_list = List.last

      expect(list_data['title']).to eq('Groceries')
      expect(new_list.title).to eq('Groceries')
    end

    it "updates a list" do
      list = List.create!(title: 'list title')

      list_update = {
        "title" => "Groceries"
      }

      get :update, { :format => 'json', id: list.id, :list => list_update }

      expect(response).to be_successful

      list_data = JSON.parse(response.body)

      expect(list_data['title']).to eq('Groceries')
      expect(List.find(list.id).title).to eq('Groceries')
    end

    it "deletes a list" do
      list = List.create!(title: 'list title')

      get :destroy, { :format => 'json', id: list.id }

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(List.all.count).to eq(0)
    end
  end
end
