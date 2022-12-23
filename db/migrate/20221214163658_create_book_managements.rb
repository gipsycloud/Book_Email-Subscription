class CreateBookManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :book_managements do |t|
      t.string :title
      t.string :description
      t.references :author, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
