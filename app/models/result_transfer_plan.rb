class ResultTransferPlan < ApplicationRecord
  #Relacion con periodo de un plan de acción
  belongs_to :plan_period

  #Validaciones de los campos para crear un plan de un proyecto de investigacion
  validates :activity, :description, :goal, :period_id, presence: true
end
