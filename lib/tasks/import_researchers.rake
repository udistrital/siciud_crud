require 'csv'
namespace :import_researchers do
	desc "Import researchers data from spreadsheet"
	task data: :environment do
	    puts 'Cleaning up Model'
		Researcher.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('researchers')
		CSV.foreach('lib/data/group_members_valid231220.csv', {:headers => [
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
    researcher = Researcher.create(
        identification_number: row[:documento],
        phone_number_one: row[:telefono],
        phone_number_two: row[:telefono2],
        mobile_number_one: row[:celular],
        mobile_number_two: row[:celular2],
        address: row[:direccion],
        created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id
    )
    user = User.create(
        identification_number: row[:documento],
        created_by: User.find_by(identification_number: '1234567890').id,
        updated_by: User.find_by(identification_number: '1234567890').id,
        user_role_id: 5
    )
    puts "Researcher with doc: '#{researcher.identification_number}' created"
end
puts "Researcher data successfully imported!"
end
end
