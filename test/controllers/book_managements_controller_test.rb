require 'test_helper'

class BookManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_management = book_managements(:one)
  end

  test "should get index" do
    get book_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_book_management_url
    assert_response :success
  end

  test "should create book_management" do
    assert_difference('BookManagement.count') do
      post book_managements_url, params: { book_management: { author_id: @book_management.author_id, category_id: @book_management.category_id, description: @book_management.description, title: @book_management.title } }
    end

    assert_redirected_to book_management_url(BookManagement.last)
  end

  test "should show book_management" do
    get book_management_url(@book_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_management_url(@book_management)
    assert_response :success
  end

  test "should update book_management" do
    patch book_management_url(@book_management), params: { book_management: { author_id: @book_management.author_id, category_id: @book_management.category_id, description: @book_management.description, title: @book_management.title } }
    assert_redirected_to book_management_url(@book_management)
  end

  test "should destroy book_management" do
    assert_difference('BookManagement.count', -1) do
      delete book_management_url(@book_management)
    end

    assert_redirected_to book_managements_url
  end
end
