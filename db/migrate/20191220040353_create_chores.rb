class CreateChores < ActiveRecord::Migration[5.2]

  def change
    create_table :chores do |t|
      t.string :name
      t.string :description
      t.string :user_id
    end
  end
end
