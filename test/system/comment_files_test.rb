require "application_system_test_case"

class CommentFilesTest < ApplicationSystemTestCase
  setup do
    @comment_file = comment_files(:one)
  end

  test "visiting the index" do
    visit comment_files_url
    assert_selector "h1", text: "Comment Files"
  end

  test "creating a Comment file" do
    visit comment_files_url
    click_on "New Comment File"

    fill_in "File", with: @comment_file.file
    fill_in "User", with: @comment_file.user_id
    click_on "Create Comment file"

    assert_text "Comment file was successfully created"
    click_on "Back"
  end

  test "updating a Comment file" do
    visit comment_files_url
    click_on "Edit", match: :first

    fill_in "File", with: @comment_file.file
    fill_in "User", with: @comment_file.user_id
    click_on "Update Comment file"

    assert_text "Comment file was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment file" do
    visit comment_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment file was successfully destroyed"
  end
end
