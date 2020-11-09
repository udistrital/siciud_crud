require 'csv'
namespace :import_research_groups_members do
	desc "Import research_groups_members data from spreadsheet"
	task data: :environment do
		puts 'Cleaning up Model'
		GroupMember.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('group_members')
		CSV.foreach('lib/data/group_members_valid071120.csv', {:headers => [
        :documento,
        :idpapel,
        :papel,
        :idGrupoSemillero,
        :nombre,
        :fechaVinculacion,
        :fechaSalida
		]
	}
) do |row|
    researcher = Researcher.find_by(identification_number: row[:documento])
    		gm_state_id = case row[:fechaSalida]
            when nil
            1
            else
            2
            end
	member = GroupMember.create(
		role_id: row[:idpapel],
		researcher_id: researcher.id,
		research_group_id: row[:idGrupoSemillero],
		gm_state_id: gm_state_id
	)
	puts "Importing member '#{researcher.id}' into group '#{member.research_group_id}"
#     gm_history = gm_history?.create(
#         initial_date: row[:fechaVinculacion]
#         final_date: row[:fechaSalida]
#         role_id: row[:idpapel]
#         group_member_id: member.id,
#     )
end
puts "Member data successfully imported!"
end
end
