class Manager < ActiveRecord::Base
  attr_accessible :due_date, :priority, :task
  scope :today, -> {where("due_date between ? and ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)}
  scope :tomorrow, -> {where("due_date between ? and ?", DateTime.now.tomorrow.beginning_of_day, DateTime.now.tomorrow.end_of_day)}
  scope :beyond, -> {where("due_date > ?", DateTime.now.tomorrow.end_of_day)}
  def format_priority
  	if self.priority == 1
  		'!'
  	elsif self.priority == 2
  		'!!'
  	else
  		'!!!'
	 end	
  end
end
