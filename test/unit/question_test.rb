require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  context "Model Validations" do
    should validate_presence_of(:list)
  end
end
