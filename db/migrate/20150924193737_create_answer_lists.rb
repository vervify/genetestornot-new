class CreateAnswerLists < ActiveRecord::Migration
  def change
    create_table :answer_lists do |t|
      t.string :family_risks
      t.string :useful
      t.string :pros_and_cons
      t.string :timing

      t.timestamps null: false
    end
  end
end
