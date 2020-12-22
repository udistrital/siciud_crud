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
        :fechaSalida,
        :mail1,
        :mail2,
        :telefono,
        :telefono2,
        :celular,
        :celular2,
        :direccion
		]
	}
) do |row|
    		gm_state_id = case row[:fechaSalida]
            when nil
            1
            else
            2
            end
    		role_id = case row[:idpapel]
            when "7"
            0
            when "8"
            0
            when "9"
            0
            when "10"
            0
            else
            row[:idpapel]
            end
	member = GroupMember.create(
		role_id: role_id,
		researcher_id: Researcher.find_by(identification_number: row[:documento]).id,
		research_group_id: ResearchGroup.find_by(legacy_siciud_id: row[:idGrupoSemillero]).id,
		gm_state_id: gm_state_id,
		created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id,
	)
	puts "Importing member '#{researcher.id}' into group '#{member.research_group_id}"
#     gm_history = gm_history?.create(
#         initial_date: row[:fechaVinculacion]
#         final_date: row[:fechaSalida]
#         role_id: row[:idpapel]
#         group_member_id: member.id,
# #     )
# Model is GmPeriod
end
puts "Member data successfully imported!"
end
end
