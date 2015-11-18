class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.references :project, index:true
      t.timestamps null: false
      t.integer :project_id 
      t.integer :hours
      t.integer :minutes
      t.text :comments
      t.datetime :date
    end
  end
end
