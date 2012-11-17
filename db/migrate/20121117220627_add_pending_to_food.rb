class AddPendingToFood < ActiveRecord::Migration
  def change
    add_column :foods, :pending, :boolean, :default => false
  end
end
