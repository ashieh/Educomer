class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :UPC
      t.text :ingredients
      t.string :nutr_score
      t.string :econ_score
      t.string :gastro_score
      t.text :nutr_advice
      t.text :econ_advice
      t.text :gastro_advice

      t.timestamps
    end
  end
end
