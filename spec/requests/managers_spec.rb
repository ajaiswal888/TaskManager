require 'rails_helper'

RSpec.describe "Managers", :type => :request do |variable|
	before do
		@manager = Manager.create :task => 'go to bed', :due_date => DateTime.now.end_of_hour, :priority => 3
	end
	describe "GET /managers" do 
		it "displays some tasks" do
			visit managers_path
			expect(page).to have_content 'go to bed'
		end
		it "creates a new task" do
			visit managers_path
			fill_in 'Task', :with => 'go to work'
			select('59', from: 'manager_due_date_5i')
			select('!!', :from => 'Priority')
			click_button 'Create Task'
			expect(current_path).to eq managers_path
			expect(page).to have_content 'go to work'
			save_and_open_page
		end
		it "should not create an empty task" do
			visit managers_path
			select('59', from: 'manager_due_date_5i')
			select('!!', :from => 'Priority')
			click_button 'Create Task'
			expect(current_path).to eq managers_path
			expect(page).to have_content 'There was an error. Please fill in a task!'
		end
	end
end