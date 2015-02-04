require 'rails_helper'

RSpec.describe Manager, :type => :model do
  before do
  	@manager = Manager.create(due_date: DateTime.now.end_of_hour, priority: 2, task: 'hello')
  	@managertwo = Manager.create(due_date: DateTime.now.tomorrow.end_of_hour, priority: 1, task: 'waddup')
  	@managerthree = Manager.create(due_date: 3.days.from_now, priority: 3, task: 'peace')
  end
  it "selects tasks for today" do
  	expect(Manager.today.pluck(:task)).to eq ['hello']
  	# expect(Manager.today.pluck(:task)).to_not eq ['waddup']
  	# expect(Manager.today.pluck(:task)).to_not eq ['peace']
  end
  it "selects tasks for tomorrow" do
  	expect(Manager.tomorrow.pluck(:task)).to eq ['waddup'] 
  	# expect(Manager.tomorrow.pluck(:task)).to_not eq ['hello']
  	# expect(Manager.tomorrow.pluck(:task)).to_not eq ['peace']
  end
  it "selects tasks in the future" do
  	expect(Manager.beyond.pluck(:task)).to eq ['peace']
  	# expect(Manager.beyond.pluck(:task)).to_not eq ['hello']
  	# expect(Manager.beyond.pluck(:task)).to_not eq ['waddup']
  end
  it "changes the priority for the format" do
  	expect(@manager.format_priority).to eq '!!'
  	expect(@managertwo.format_priority).to eq '!'
  	expect(@managerthree.format_priority).to eq '!!!'
  end
end
