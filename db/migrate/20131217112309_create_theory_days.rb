class CreateTheoryDays < ActiveRecord::Migration
  def change
    create_table :theory_days do |t|
      t.datetime :start_date
      t.time :start_time
      t.time :end_time
      t.integer :repeat_weekly
      t.references :school_class, index: true

      t.timestamps
    end
  end
end
