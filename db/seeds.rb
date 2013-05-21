Admin.create!(
  email:                 'unindented@gmail.com',
  password:              'changeme',
  password_confirmation: 'changeme'
)

Role.create!(name: 'Java Engineer')
Role.create!(name: 'Ruby on Rails Engineer')
Role.create!(name: 'JavaScript Engineer')
Role.create!(name: 'iOS / Android Engineer')
Role.create!(name: 'QA Test Engineer')
Role.create!(name: 'UX Designer')
Role.create!(name: 'UI Designer')
Role.create!(name: 'Product Manager')
