RailsAdmin.config do |config|

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Recruit', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated

end
