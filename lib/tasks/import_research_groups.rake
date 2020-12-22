require 'csv'
namespace :import_research_groups do
	desc "Import research_groups data from spreadsheet"
	task data: :environment do
		puts 'Cleaning up Model'
		FacultyIdsResearchGroup.destroy_all
		CurricularPrjIdsResearchGroup.destroy_all
		ResearchGroup.destroy_all
		curricularProjects = {
                    40 => 26,
                    50 => 31,
                    73 => 108,
                    74 => 115,
                    77 => 114,
                    78 => 116,
                    79 => 109,
                    135 => 24,
                    155 => 16,
                    165 => 0,
                    187 => 88,
                    188 => 87,
                    4 => 37,
                    33 => 23,
                    30 => 113,
                    25 => 70,
                    20 => 72,
                    7 => 74,
                    5 => 73,
                    15 => 79,
                    81 => 111,
                    85 => 112,
                    97 => 38,
                    98 => 39,
                    18 => 34,
                    92 => 0,
                    17 => 0,
                    99 => 18,
                    94 => 61,
                    91 => 0,
                    117 => 51,
                    197 => 57,
                    198 => 19,
                    93 => 63,
                    90 => 62,
                    14 => 53,
                    13 => 56,
                    89 => 0,
                    295 => 21,
                    195 => 21,
                    196 => 22,
                    95 => 0,
                    57 => 89,
                    176 => 0,
                    37 => 0,
                    39 => 0,
                    23 => 0,
                    164 => 0,
                    47 => 0,
                    61 => 0,
                    0 => 0,
                    114 => 50,
                    185 => 121,
                    62 => 90,
                    56 => 0,
                    170 => 0,
                    160 => 28,
                    601 => 125,
                    145 => 30,
                    16 => 40,
                    45 => 91,
                    134 => 127,
                    60 => 0,
                    2 => 25,
                    103 => 146,
                    375 => 199,
                    377 => 71,
                    372 => 139,
                    273 => 77,
                    283 => 203,
                    378 => 200,
                    279 => 68,
                    278 => 0,
                    21 => 145,
                    284 => 159,
                    543 => 141,
                    602 => 150,
                    604 => 149,
                    605 => 147,
                    606 => 142,
                    10 => 78,
                    180 => 69,
                    27 => 166,
                    495 => 0,
                    110 => 140,
                    65 => 0,
                    123 => 169,
                    607 => 0,
                    28 => 204,
                    603 => 0,
                    72 => 110,
                    1 => 0,
                    609 => 0,
                    610 => 206,
                    608 => 170,
                    611 => 27,
                    612 => 16,
                    613 => 208
                    }
		ActiveRecord::Base.connection.reset_pk_sequence!('faculty_ids_research_groups')
		ActiveRecord::Base.connection.reset_pk_sequence!('curricular_prj_ids_research_groups')
		ActiveRecord::Base.connection.reset_pk_sequence!('research_groups')
		CSV.foreach('lib/data/cidc_grup_semill-21-12-2020.csv', {:headers => [
        :cgsid,
        :cgscodigo,
        :cgsnombre,
        :cgssiglas,
        :cgsweb,
        :cgsmail,
        :cgsfeccreacion,
        :cgsfacultad,
        :cgsmision,
        :cgsvision,
        :cgstipo,
        :cgscategoria,
        :cgsdirector,
        :cgsobservaciones,
        :cgsestado,
        :cgshabilmovilidad,
        :cgsdescripcion,
        :cgsgruplac,
        :cgscodcolciencias,
        :cgspncyt1,
        :cgspncyt2,
        :cgsareaconocimiento,
        :cgsanoformacioncolciencias,
        :cgsmesformacioncolciencias,
        :cgsidplan,
        :cgsproyectocur,
        :cgsareasnies,
        :cgsfechafac,
        :cgsnumerocidc,
        :cgsnumerofac,
        :cgsactcidc,
        :cgsactfac
		]
	}
) do |row|
		faculty_id = case row[:cgsfacultad]
        when "1"
        66 #Tecnologica
        when "2"
        14 #Ingenieria
        when "3"
        65 #MedioAmbiente
        when "4"
        17 #CienciasEducacion
        when "5"
        35 #Artes
        else
        row[:cgsfacultad]
        end

        facultyregistrationdate = case row[:cgsfechafac]
          when 'NULL'
          '12/12/2000'
          else
          row[:cgsfechafac]
          end

        curricular_project_id = '1'
        curricularProjects.each do | siciudId, oasID |
        curricular_project_id = case row[:cgsproyectocur]
        when siciudId
        oasID
        else
        row[:cgsproyectocur]
        end
  end

  begin
     	groups = ResearchGroup.create!(
	    legacy_siciud_id: row[:cgsid],
		name: row[:cgsnombre],
		acronym: row[:cgssiglas],
		group_state_id: row[:cgsestado],
		group_type_id: row[:cgstipo],
		cidc_registration_date: row[:cgsfeccreacion],
		cidc_act_number: row[:cgsnumerocidc],
		faculty_registration_date: facultyregistrationdate,
		snies_id: row[:cgsareasnies],
		email: row[:cgsmail],
		colciencias_code: row[:cgscodcolciencias],
		webpage: row[:cgsweb],
		gruplac: row[:cgsgruplac],
		faculty_act_number: row[:cgsnumerofac],
		mission: row[:cgsmision],
        vision: row[:cgsvision],
        description: row[:cgsdescripcion],
        created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id,
    )
	faculties =	FacultyIdsResearchGroup.create(
	    research_group_id:groups.id,
	    faculty_id:	faculty_id,
        created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id
	)
	curricular_projects = CurricularPrjIdsResearchGroup.create(
	    research_group_id:groups.id,
	    curricular_project_id:	curricular_project_id,
        created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id
	)
	    rescue ActiveRecord::RecordInvalid => e_ri
          puts"Importing research group: #{e_ri}"
          exit
        rescue Exception => e
          puts"Error creating or validating #{e}"
          exit
end


end
puts "Research groups data successfully imported!"
end
end
