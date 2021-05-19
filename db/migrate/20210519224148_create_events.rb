class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :tpeople
      t.string :frequency
      t.string :type
      t.string :category
      t.datetime :date
      t.string :location
      t.integer :user_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
