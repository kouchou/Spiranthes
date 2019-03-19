class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :body
      t.boolean :is_answered, null: false, default: false
      
      t.timestamps
    end
  end
end
