namespace :add_group_roles do
	desc "Add roles"
	task data: :environment do
		puts 'Cleaning up Model'
		Role.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('roles')
        roles = {
        0 => 'Sin asignar',
        1 => 'Director',
        2 => 'Docente',
        3 => 'Estudiante',
        4 => 'Egresado',
        5 => 'Lider semillero',
        6 => 'Invitado'
        }
    roles.each do | roleId, roleName |
	role = Role.create(
		id: roleId,
		name: roleName
	)
	puts "Importing role: '#{role.name} - id #{role.id}'"
end
puts "Roles successfully created!"
end
end
