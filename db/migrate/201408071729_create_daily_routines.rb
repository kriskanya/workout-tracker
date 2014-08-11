class CreateDailyRoutines < ActiveRecord::Migration
  def change
    create_table :daily_routines do |t|
      t.string :name

      t.timestamps
    end
  end
end
