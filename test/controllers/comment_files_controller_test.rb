require 'test_helper'

class CommentFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_file = comment_files(:one)
  end

  test "should get index" do
    get comment_files_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_file_url
    assert_response :success
  end

  test "should create comment_file" do
    assert_difference('CommentFile.count') do
      post comment_files_url, params: { comment_file: { file: @comment_file.file, user_id: @comment_file.user_id } }
    end

    assert_redirected_to comment_file_url(CommentFile.last)
  end

  test "should show comment_file" do
    get comment_file_url(@comment_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_file_url(@comment_file)
    assert_response :success
  end

  test "should update comment_file" do
    patch comment_file_url(@comment_file), params: { comment_file: { file: @comment_file.file, user_id: @comment_file.user_id } }
    assert_redirected_to comment_file_url(@comment_file)
  end

  test "should destroy comment_file" do
    assert_difference('CommentFile.count', -1) do
      delete comment_file_url(@comment_file)
    end

    assert_redirected_to comment_files_url
  end
end
