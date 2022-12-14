require "application_system_test_case"

class BookManagementsTest < ApplicationSystemTestCase
  setup do
    @book_management = book_managements(:one)
  end

  test "visiting the index" do
    visit book_managements_url
    assert_selector "h1", text: "Book Managements"
  end

  test "creating a Book management" do
    visit book_managements_url
    click_on "New Book Management"

    fill_in "Author", with: @book_management.author_id
    fill_in "Category", with: @book_management.category_id
    fill_in "Description", with: @book_management.description
    fill_in "Title", with: @book_management.title
    click_on "Create Book management"

    assert_text "Book management was successfully created"
    click_on "Back"
  end

  test "updating a Book management" do
    visit book_managements_url
    click_on "Edit", match: :first

    fill_in "Author", with: @book_management.author_id
    fill_in "Category", with: @book_management.category_id
    fill_in "Description", with: @book_management.description
    fill_in "Title", with: @book_management.title
    click_on "Update Book management"

    assert_text "Book management was successfully updated"
    click_on "Back"
  end

  test "destroying a Book management" do
    visit book_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book management was successfully destroyed"
  end
end
