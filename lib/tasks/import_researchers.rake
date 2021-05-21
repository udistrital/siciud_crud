require 'csv'
namespace :import_researchers do
  desc "Import researchers data from spreadsheet"
  task data: :environment do
    puts 'Cleaning up Model'
    Researcher.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('researchers')
    CSV.foreach('lib/data/group_members_valid_202104281045.csv', { :headers => [
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

      researcher_exists = Researcher.find_by(identification_number: row[:documento])

      if researcher_exists.nil?
        researcher = Researcher.create(
          identification_number: row[:documento],
          phone_number_one: row[:telefono],
          phone_number_two: row[:telefono2],
          mobile_number_one: row[:celular],
          mobile_number_two: row[:celular2],
          address: row[:direccion],
          created_by: User.find_by(identification_number: '1234567890').id
        )
        puts "Researcher with doc: '#{researcher.identification_number}' created"
      end

      user_exists = User.find_by(identification_number: row[:documento])

      if user_exists.nil?
        user = User.create(
          identification_number: row[:documento],
          created_by: User.find_by(identification_number: '1234567890').id,
          user_role_id: 5
        )
        puts "User with doc: '#{user.identification_number}' created"
      end
    end
    puts "Researcher data successfully imported!"
  end
end
