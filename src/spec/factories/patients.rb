FactoryBot.define do
  factory :patient do
    encrypted_password { 'password' }
    password           { 'password' }
    name               { '真子' }
    name_kana          { 'まこ' }
    birthday           { '20221024' }
    tel                { '090-8978-5546' }
  end
end
