class ManagersController < ApplicationController
  def index
  	@manager = Manager.new
  	@managers = Manager.all
  end
  def create
  	@manager = Manager.new
  	@manager.task = params[:manager][:task]
  	if params[:manager][:task].blank? == true
  		redirect_to :back, :notice => 'There was an error. Please fill in a task!'
  	else
  		Manager.create params[:manager]
  		redirect_to :back
	end
  end
  def edit
  	@manager = Manager.find params[:id]
  end
end
