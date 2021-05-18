require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get _form," do
    get tasks__form,_url
    assert_response :success
  end

  test "should get edit," do
    get tasks_edit,_url
    assert_response :success
  end

  test "should get index," do
    get tasks_index,_url
    assert_response :success
  end

  test "should get new," do
    get tasks_new,_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

end
