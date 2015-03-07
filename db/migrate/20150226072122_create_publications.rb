class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :pmid
      t.string :title
      t.text :authors
      t.string :date
      t.text :abstract
      t.timestamps
    end
  end
end
