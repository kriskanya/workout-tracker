class CreateDailyRoutines << ActiveRecord::Migration
  def change
    create_table :dailyroutines do |t|
      t.string :name

      t.timestamps
    end
  end
end
