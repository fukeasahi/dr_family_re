class CreateMedicalExaminationReports < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_examination_reports do |t|
      t.integer    :fill_in_person, null: false, default: 0
      t.integer    :family_id
      t.text       :consultation
      t.text       :about_medicine
      t.text       :remarks
      t.timestamps
    end
  end
end