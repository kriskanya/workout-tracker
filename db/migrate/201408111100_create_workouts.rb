class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.references :daily_routine

      t.timestamps
    end
  end
end
