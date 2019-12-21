class Finishes < ActiveRecord::Migration[5.2]
  
  def change
      create_table :finishes do |t|
      t.string :chores_id
      t.string :tools_id
      end
  end
end
