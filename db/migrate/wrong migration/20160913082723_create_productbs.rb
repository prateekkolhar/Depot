class CreateProductbs < ActiveRecord::Migration
  def change
    create_table :productbs do |t|
      t.string :title
      t.string :string
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
