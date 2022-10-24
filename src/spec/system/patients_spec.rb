require 'rails_helper'

RSpec.describe "Patients", type: :system do
  it "サインアップのため" do
    visit root_path
    click_link 'サインアップ'
    expect(page).not_to have_content 'ログアウト'
    fill_in '名前', with: '倉木麻衣'
    fill_in '名前(かな)', with: 'くらきまい'
    fill_in '生年月日', with: '1982年10月28日'
    fill_in '電話番号', with: '09089478988'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード(確認)', with: 'password'
    click_button '登録'
    expect(page).to have_content 'ログアウト'
  end

  it 'ログイン' do
    patient = FactoryBot.create(:patient)
    sign_in patient
    visit root_path
    expect(page).to have_content 'ログアウト'
  end

  it 'ログインのため' do
    FactoryBot.create(:patient)
    visit root_path
    click_link 'ログイン'
    expect(page).not_to have_content 'ログアウト'
    fill_in '名前', with: '真子'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'ログアウト'
  end
end
