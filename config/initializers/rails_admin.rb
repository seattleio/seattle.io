RailsAdmin.config do |config|

  config.main_app_name = ["seattle.io", "ADMIN"]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version'

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    history_index
    history_show
  end

  config.model 'Post' do
    configure :created_at do
      show
    end
    
    list do
      
    end
  end
end
