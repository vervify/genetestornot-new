class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.string :response_01
      t.string :response_02
      t.string :response_03
      t.string :response_04

      t.timestamps null: false
    end
  end
end
