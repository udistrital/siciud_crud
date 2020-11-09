require 'csv'
namespace :import_research_groups do
	desc "Import research_groups data from spreadsheet"
	task data: :environment do
		puts 'Cleaning up Model'
		ResearchGroup.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('research_groups')
		CSV.foreach('lib/data/cidc_grup_semill-12-10-2020v3.csv', {:headers => [
		:cgsid,
        :cgscodigo,
        :cgsnombre,
        :cgssiglas,
        :cgsweb,
        :cgsmail,
        :cgsfeccreacion,
        :cgsfacultad,
        :cgsmision,
        :cgstipo,
        :cgscategoria,
        :cgsestado,
        :cgsgruplac,
        :cgscodcolciencias,
        :cgsareasnies,
        :cgsactfac,
        :cgsnumerocidc,
        :cgsnumerofac,
        :cgsvision,
        :cgsdescripcion,
        :cgsobservaciones
		]
	}
) do |row|
# 		group_type_id = case row[:group_type]
#         when "Grupo"
#         1
#         when "Semillero"
#         2
#         else
#         1
#         end
#
# 		group_state_id = case row[:group_state]
#         when "Activo"
#         1
#         when "Inactivo"
#         2
#         else
#         2
#         end
	groups = ResearchGroup.create(
    	id: row[:cgsid],
		name: row[:cgsnombre],
		acronym: row[:cgssiglas],
		group_state_id: row[:cgsestado],
		group_type_id: row[:cgstipo],
		cidc_registration_date: row[:cgsfeccreacion],
		cidc_act_number: row[:cgsnumerocidc],
		faculty_registration_date: '01/01/2020',
		snies_id: row[:cgsareasnies],
		email: row[:cgsmail],
		colciencias_code: row[:cgscodcolciencias],
		webpage: row[:cgsweb],
		gruplac: row[:cgsgruplac],
		faculty_act_number: row[:cgsnumerofac],
		# extranotes: row[:cgsobservaciones],
		mission: row[:cgsmision],
        vision: row[:cgsvision],
        description: row[:cgsdescripcion]
	)
	puts "Importing research group: '#{groups.name}'"
end
puts "Research groups data successfully imported!"
end
end
