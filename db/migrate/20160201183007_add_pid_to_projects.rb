class AddPidToProjects < ActiveRecord::Migration
  def change
		add_column :projects, :pid, :integer
  end
end
