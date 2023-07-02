class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.references :user, foreign_key: true
      t.datetime :clock_in_time
      t.datetime :clock_out_time
      t.timestamps
    end
  end
end
