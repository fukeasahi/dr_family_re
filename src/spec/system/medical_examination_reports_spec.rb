require 'rails_helper'

RSpec.describe "MedicalExaminationReports", type: :system do
  describe '診療連絡票をテストするため' do
    it '一覧画面の表示のため' do
      visit medical_examination_reports_path
      expect(page).to have_content '診療連絡票一覧'
    end

    it '新規作成するため' do
      visit root_path
      expect(page).to have_content 'Homeです'
      click_link '診療連絡票新規作成'
      fill_in '日頃の様子、気になる点、相談内容など', with: '体の調子を相談したいです。'
      fill_in '薬・医療材料について(残量や追加希望など)', with: '薬の残量は3袋です。'
      fill_in '備考', with: '特にありません。'
      click_button '送信'
      expect(page).to have_content '詳細ページ'
      expect(page).to have_content '体の調子を相談したいです。'
      expect(page).to have_content '薬の残量は3袋です。'
      expect(page).to have_content '特にありません。'
    end

    it '更新のため' do
      report = FactoryBot.create(:medical_examination_report)
      visit edit_medical_examination_report_path(report)
      expect(page).not_to have_content '体の調子を相談したいです2。'
      expect(page).not_to have_content '薬の残量は3袋です2。'
      expect(page).not_to have_content '特にありません2。'
      fill_in '日頃の様子、気になる点、相談内容など', with: '体の調子を相談したいです2。'
      fill_in '薬・医療材料について(残量や追加希望など)', with: '薬の残量は3袋です2。'
      fill_in '備考', with: '特にありません2。'
      click_button '送信'
      expect(page).to have_content '詳細ページ'
      expect(page).to have_content '体の調子を相談したいです2。'
      expect(page).to have_content '薬の残量は3袋です2。'
      expect(page).to have_content '特にありません2。'
    end
  end
end
