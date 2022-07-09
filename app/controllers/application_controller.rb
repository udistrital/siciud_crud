class ApplicationController < ActionController::API

  # Handling of database exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::InvalidForeignKey do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def active_in_body_params? (body)
    active_in_body = (body.include? "active") || (body.include? :active)
    unless active_in_body
      render json: { error: "active can't be nil" }, status: :unprocessable_entity
    end
  end

  def set_general_context
    if params[:research_group_id]
      id = params[:research_group_id]
      @context = ResearchGroup.find(id)
    elsif params[:call_id]
      id = params[:call_id]
      @context = Call.find(id)
    elsif params[:research_network_id]
      id = params[:research_network_id]
      @context = ResearchNetwork.find(id)
    elsif params[:form_a_act_plan_id]
      id = params[:form_a_act_plan_id]
      @context = FormAActPlan.find(id)
    elsif params[:form_b_act_plan_id]
      id = params[:form_b_act_plan_id]
      @context = FormBActPlan.find(id)
    elsif params[:form_c_act_plan_id]
      id = params[:form_c_act_plan_id]
      @context = FormCActPlan.find(id)
    elsif params[:form_d_act_plan_id]
      id = params[:form_d_act_plan_id]
      @context = FormDActPlan.find(id)
    elsif params[:research_groups_research_network_id]
      id = params[:research_groups_research_network_id]
      @context = ResearchGroupsResearchNetwork.find(id)
    elsif params[:manual_id]
      id = params[:manual_id]
      @context = Subtype.find(id)
    elsif params[:mobility_call_id]
      id = params[:mobility_call_id]
      @context = MobilityCall.find(id)
    else
      set_product_context
    end
  end

  def set_chapter_context
    if params[:call_id]
      id = params[:call_id]
      @chapter_context = Call.find(id)
    elsif params[:proposal_id]
      id = params[:proposal_id]
      @chapter_context = Proposal.find(id)
    end
  end

  def set_product_context
    if params[:book_id]
      id = params[:book_id]
      @context = Book.find(id)
    elsif params[:book_chapter_id]
      id = params[:book_chapter_id]
      @context = BookChapter.find(id)
    elsif params[:ip_livestock_breed_id]
      id = params[:ip_livestock_breed_id]
      @context = IpLivestockBreed.find(id)
    elsif params[:new_animal_breed_id]
      id = params[:new_animal_breed_id]
      @context = NewAnimalBreed.find(id)
    elsif params[:paper_id]
      id = params[:paper_id]
      @context = Paper.find(id)
    elsif params[:patent_id]
      id = params[:patent_id]
      @context = Patent.find(id)
    elsif params[:research_creation_work_id]
      id = params[:research_creation_work_id]
      @context = ResearchCreationWork.find(id)
    elsif params[:scientific_note_id]
      id = params[:scientific_note_id]
      @context = ScientificNote.find(id)
    elsif params[:vegetable_variety_id]
      id = params[:vegetable_variety_id]
      @context = VegetableVariety.find(id)
    elsif params[:industrial_design_id]
      id = params[:industrial_design_id]
      @context = IndustrialDesign.find(id)
    elsif params[:integrated_circuit_diagram_id]
      id = params[:integrated_circuit_diagram_id]
      @context = IntegratedCircuitDiagram.find(id)
    elsif params[:software_id]
      id = params[:software_id]
      @context = Software.find(id)
    elsif params[:plant_ind_prototype_id]
      id = params[:plant_ind_prototype_id]
      @context = PlantIndPrototype.find(id)
    elsif params[:new_scientific_record_id]
      id = params[:new_scientific_record_id]
      @context = NewScientificRecord.find(id)
    elsif params[:event_id]
      id = params[:event_id]
      @context = Event.find(id)
    elsif params[:degree_work_id]
      id = params[:degree_work_id]
      @context = DegreeWork.find(id)
    elsif params[:technical_concept_id]
      id = params[:technical_concept_id]
      @context = TechnicalConcept.find(id)
    elsif params[:distinctive_sign_id]
      id = params[:distinctive_sign_id]
      @context = DistinctiveSign.find(id)
    elsif params[:nutraceutical_product_id]
      id = params[:nutraceutical_product_id]
      @context = NutraceuticalProduct.find(id)
    elsif params[:scientific_collection_id]
      id = params[:scientific_collection_id]
      @context = ScientificCollection.find(id)
    elsif params[:enterprise_secret_id]
      id = params[:enterprise_secret_id]
      @context = EnterpriseSecret.find(id)
    elsif params[:enterprise_id]
      id = params[:enterprise_id]
      @context = Enterprise.find(id)
    elsif params[:innovation_id]
      id = params[:innovation_id]
      @context = Innovation.find(id)
    elsif params[:regulation_id]
      id = params[:regulation_id]
      @context = Regulation.find(id)
    elsif params[:clinical_practice_guideline_id]
      id = params[:clinical_practice_guideline_id]
      @context = ClinicalPracticeGuideline.find(id)
    elsif params[:guide_manual_id]
      id = params[:guide_manual_id]
      @context = GuideManual.find(id)
    elsif params[:protocol_act_id]
      id = params[:protocol_act_id]
      @context = ProtocolAct.find(id)
    elsif params[:bill_id]
      id = params[:bill_id]
      @context = Bill.find(id)
    elsif params[:license_agreement_id]
      id = params[:license_agreement_id]
      @context = LicenseAgreement.find(id)
    elsif params[:appropriation_process_id]
      id = params[:appropriation_process_id]
      @context = AppropriationProcess.find(id)
    elsif params[:appropriation_process_id]
      id = params[:appropriation_process_id]
      @context = AppropriationProcess.find(id)
    elsif params[:knowledge_network_id]
      id = params[:knowledge_network_id]
      @context = KnowledgeNetwork.find(id)
    elsif params[:creation_workshop_id]
      id = params[:creation_workshop_id]
      @context = CreationWorkshop.find(id)
    elsif params[:working_paper_id]
      id = params[:working_paper_id]
      @context = WorkingPaper.find(id)
    elsif params[:new_genetic_sequence_id]
      id = params[:new_genetic_sequence_id]
      @context = NewGeneticSequence.find(id)
    elsif params[:report_id]
      id = params[:report_id]
      @context = Report.find(id)
    elsif params[:consultancy_id]
      id = params[:consultancy_id]
      @context = Consultancy.find(id)
    elsif params[:magazine_edition_id]
      id = params[:magazine_edition_id]
      @context = MagazineEdition.find(id)
    elsif params[:publication_id]
      id = params[:publication_id]
      @context = Publication.find(id)
    elsif params[:simple_book_id]
      id = params[:simple_book_id]
      @context = SimpleBook.find(id)
    elsif params[:content_generation_id]
      id = params[:content_generation_id]
      @context = ContentGeneration.find(id)
    elsif params[:informative_bulletin_id]
      id = params[:informative_bulletin_id]
      @context = InformativeBulletin.find(id)
    elsif params[:investigation_project_id]
      id = params[:investigation_project_id]
      @context = InvestigationProject.find(id)
    elsif params[:idi_investigation_project_id]
      id = params[:idi_investigation_project_id]
      @context = IdiInvestigationProject.find(id)
    elsif params[:extension_project_id]
      id = params[:extension_project_id]
      @context = ExtensionProject.find(id)
    elsif params[:training_course_id]
      id = params[:training_course_id]
      @context = TrainingCourse.find(id)
    elsif params[:accompaniment_consultancy_id]
      id = params[:accompaniment_consultancy_id]
      @context = AccompanimentConsultancy.find(id)
    end
  end
end
