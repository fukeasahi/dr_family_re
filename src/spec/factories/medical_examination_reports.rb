FactoryBot.define do
  factory :medical_examination_report do
    fill_in_person { 1 }
    family_id      { 1 }
    consultation   { '本当に気になっているところは血圧です。' }
    about_medicine { '薬がもうありません。' }
    remarks        { '誕生日会を行いました。' }
  end
end
