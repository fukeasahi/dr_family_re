class PhysicalConditionsController < ApplicationController
  before_action :set_physical_condition, only: [:show, :edit, :update]

  def index
    @physical_conditions = PhysicalCondition.all
  end

  def new
    @physical_condition = PhysicalCondition.new
  end

  def create
    physical_condition = PhysicalCondition.new(physical_condition_params)
    physical_condition.patient_id = 1# 後で変更
    physical_condition.save
    redirect_to physical_condition_path(physical_condition)
  end

  def show; end

  def edit; end

  def update
    @physical_condition.update!(physical_condition_params)
    redirect_to physical_condition_path(@physical_condition)
  end

  private

  def set_physical_condition
    @physical_condition = PhysicalCondition.find(params[:id])
  end

  def physical_condition_params
    params.require(:physical_condition).permit(
      :patient_id,
      :time_slot,
      :temperature,
      :high_blood_pressure,
      :low_blood_pressure,
      :pulse_rate,
      :oxygen_concentration,
      :blood_sugar_level,
      :insulin,
      :remarks)
  end
end
