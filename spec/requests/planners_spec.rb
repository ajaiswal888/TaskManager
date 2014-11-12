require 'rails_helper'

RSpec.describe "Planners", :type => :request do
  describe "GET /planners" do
    visit planners_path
  end
end
