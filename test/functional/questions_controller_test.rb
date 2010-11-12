require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_template 'index'
  end

  test "index should get list of questions" do
    get :index
    assert assigns(:questions)
  end

  test "index should get initialize new question" do
    get :index
    assert assigns(:question)
  end

  test "should find 42nd element of submitted list" do
    list = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100"

    assert_difference('Question.count') do
      post :create, :question => {:list => list }
    end
    
    assert assigns(:question).answer == "42"
    assert !flash[:notice].blank?
    assert_redirected_to(questions_path)
  end
  
  test "should error without a supplied list 42nd element of submitted list" do
    Question.any_instance.stubs(:valid?).returns(false)
    post :create, :question => Question.new
    assert_template 'index'
  end
end
