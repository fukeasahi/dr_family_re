class MedicalExaminationReportsController < ApplicationController
  before_action :set_medical_examination_report, only: [:show, :edit, :update]

  def index
    @medical_examination_reports = MedicalExaminationReport.all
  end

  def new
    @medical_examination_report = MedicalExaminationReport.new
  end

  def create
    medical_examination_report = MedicalExaminationReport.new(medical_examination_report_params)
    medical_examination_report.family_id = 1 # ここ変更
    medical_examination_report.save!
    redirect_to medical_examination_report_path(medical_examination_report)
  end

  def show; end

  def edit; end

  def update
    @medical_examination_report.update!(medical_examination_report_params)
    redirect_to medical_examination_report_path(@medical_examination_report)
  end

  private
  def set_medical_examination_report
    @medical_examination_report = MedicalExaminationReport.find(params[:id])
  end

  def medical_examination_report_params
    params.require(:medical_examination_report).permit(:fill_in_person, :consultation, :about_medicine, :remarks)
  end
end
