class CreateProjectManagers < ActiveRecord::Migration
  def change
    create_table :project_managers do |t|
      t.string :project_name

      t.timestamps
    end
  end
end
