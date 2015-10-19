class EditPass < ActiveRecord::Migration
  def change
    rename_column :passes, :teacher_id, :teacher_id_from
    add_column :passes, :teacher_id_to, :integer
  end
end
