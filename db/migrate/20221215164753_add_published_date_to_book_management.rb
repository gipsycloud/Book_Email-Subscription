class AddPublishedDateToBookManagement < ActiveRecord::Migration[6.0]
  def change
    add_column :book_managements, :published_date, :date
    add_column :book_managements, :publish, :integer
  end
end
