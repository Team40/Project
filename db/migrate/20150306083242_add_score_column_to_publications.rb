class AddScoreColumnToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :score, :integer
  end
end
