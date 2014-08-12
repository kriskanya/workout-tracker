class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :workout
      t.string :name, :description
      t.integer :weight, :reps, :sets

      t.timestamps
    end
  end
end
