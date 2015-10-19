class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.boolean :verified
      t.datetime :pass_datetime
      t.string :location_from
      t.string :location_to
      t.string :reason
      t.boolean :one_time

      t.timestamps null: false
    end
  end
end
