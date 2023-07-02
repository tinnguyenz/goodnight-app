class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.belongs_to :users
      t.timestamps
    end
  end
end
