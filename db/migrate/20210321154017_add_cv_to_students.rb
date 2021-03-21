class AddCvToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :cv, :string
  end
end
