Enterprise.create!(description: 'Testando Empresa',
                   primary_color: '#FFF',
                   secondary_color: '#111',
                   document_number: Faker::CNPJ.numeric,
                   company_name: Faker::Company.name,
                   fantasy_name: Faker::Company.industry,
                   email: Faker::Internet.email,
                   opening_date: Date.today.strftime('%Y-%m-%d'))
