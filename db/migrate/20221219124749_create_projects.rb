class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :text
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
