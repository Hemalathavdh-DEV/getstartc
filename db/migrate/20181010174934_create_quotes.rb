class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.text :Enter_your_quote
      t.string :Written_by
      
      t.timestamps
    end
  end
end
