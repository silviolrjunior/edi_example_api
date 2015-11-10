class AddRuleToStorage < ActiveRecord::Migration
  def change
       add_column :storages, :rule, :integer
  end
end
