require 'rails_helper'

RSpec.describe "体調管理", type: :system do
  it '新規登録' do
    visit root_path
    click_link '体調一覧'
    expect(page).to have_content '体調一覧'
  end

  it '新規登録' do
    visit physical_conditions_path
    click_link '新規登録'
    expect(page).to have_content '新規登録'
    fill_in '体温', with: 37.0
    fill_in '血圧（高）', with: 188
    fill_in '血圧（低）', with: 89
    fill_in '脈拍数', with: 73
    fill_in '酸素濃度', with: 96
    fill_in '血糖値', with: 107
    fill_in 'インスリン', with: 'グラルギン62125'
    fill_in '備考', with: 'かんたき'
    click_button '保存'
    expect(page).to have_content '詳細ページ'
    expect(page).to have_content 0
    expect(page).to have_content 37.0
    expect(page).to have_content 188
    expect(page).to have_content 89
    expect(page).to have_content 73
    expect(page).to have_content 96
    expect(page).to have_content 107
    expect(page).to have_content 'グラルギン62125'
    expect(page).to have_content 'かんたき'
  end

  it '編集画面' do
    physical_condition = FactoryBot.create(:physical_condition)
    visit physical_condition_path(physical_condition)
    click_link '編集'
    expect(page).to have_content '編集'
  end

  it '更新' do
    physical_condition = FactoryBot.create(:physical_condition)
    visit edit_physical_condition_path(physical_condition)
    fill_in '体温', with: 37.5
    fill_in '血圧（高）', with: 185
    fill_in '血圧（低）', with: 85
    fill_in '脈拍数', with: 75
    fill_in '酸素濃度', with: 95
    fill_in '血糖値', with: 105
    fill_in 'インスリン', with: 'グラルギン621255'
    fill_in '備考', with: 'かんたき5'
    click_button '保存'
    expect(page).to have_content '詳細ページ'
    expect(page).to have_content 0
    expect(page).to have_content 37.5
    expect(page).to have_content 185
    expect(page).to have_content 85
    expect(page).to have_content 75
    expect(page).to have_content 95
    expect(page).to have_content 105
    expect(page).to have_content 'グラルギン621255'
    expect(page).to have_content 'かんたき5'
  end
end
