class PlanPeriodSerializer < ActiveModel::Serializer
  attributes :id, :description, :research_project_plans, :researcher_formation_plans,
   :result_transfer_plans, :social_appropriation_plans
end

def research_project_plans
  research_project_plans = self.object.research_project_plans
end

def researcher_formation_plans
  researcher_formation_plans = self.object.researcher_formation_plans
end

def result_transfer_plans
  result_transfer_plans = self.object.result_transfer_plans
end

def social_appropriation_plans
  social_appropriation_plans = self.object.social_appropriation_plans
end