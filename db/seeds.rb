default_password = 12345678

enterprise = Enterprise.create!(primary_color: '#FFF',
                                secondary_color: '#111',
                                document_number: Faker::CNPJ.numeric,
                                company_name: Faker::Company.name,
                                fantasy_name: Faker::Company.industry,
                                email: Faker::Internet.email,
                                opening_date: Date.today.strftime('%Y-%m-%d'))

User.create!(email: 'admin@admin.com',
             password: default_password,
             password_confirmation: default_password,
             first_name: Faker::Name.name,
             last_name: Faker::Name.name,
             nickname: Faker::Name.name,
             document_number: Faker::CNPJ.numeric,
             is_employee: true,
             is_admin: true,
             is_super_admin: true,
             is_active: true,
             enterprise_id: enterprise.id)
