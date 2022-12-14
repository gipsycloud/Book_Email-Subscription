class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :photo

      t.timestamps
    end
  end
end
