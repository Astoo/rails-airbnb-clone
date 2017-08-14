class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: true
      t.string :status
      t.string :date
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
