class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :adv1
      t.text :adv2
      t.text :adv3
      t.text :adv4
      t.text :adv5

      t.timestamps
    end
  end
end
