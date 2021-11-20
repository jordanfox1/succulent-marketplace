class CreateRequestedListings < ActiveRecord::Migration[6.1]
  def change
    create_table :requested_listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
