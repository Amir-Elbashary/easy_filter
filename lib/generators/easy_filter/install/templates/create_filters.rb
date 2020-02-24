class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |t|
      t.string :products
      t.string :events
      t.string :sql_query
      t.timestamps
    end
  end
end
