require 'csv'
namespace :import_researchers do
	desc "Import researchers data from spreadsheet"
	task data: :environment do
	    puts 'Cleaning up Model'
		Researcher.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('researchers')
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
    researcher = Researcher.create(
        identification_number: row[:documento]
    )
    puts "Researcher with doc: '#{researcher.identification_number}' created"
end
puts "Researcher data successfully imported!"
end
end
