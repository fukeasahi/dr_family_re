class CreatePhysicalConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :physical_conditions do |t|
      t.integer    :patient_id,           null: false
      t.integer    :time_slot,            null: false, default: 0
      t.decimal    :temperature,          precision: 3, scale: 1
      t.integer    :high_blood_pressure
      t.integer    :low_blood_pressure
      t.integer    :pulse_rate
      t.integer    :oxygen_concentration
      t.integer    :blood_sugar_level
      t.string     :insulin
      t.text       :remarks
      t.timestamps
    end
  end
end
