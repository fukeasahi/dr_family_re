FactoryBot.define do
  factory :physical_condition do
    patient_id           { 1 }
    time_slot            { 1 }
    temperature          { 36.8 }
    high_blood_pressure  { 154 }
    low_blood_pressure   { 91 }
    pulse_rate           { 76 }
    oxygen_concentration { 98 }
    blood_sugar_level    { 376 }
    insulin              { 'グラルギン6 21:25' }
    remarks              { 'かんたき' }
  end
end
