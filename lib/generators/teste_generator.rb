class TesteGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)
  class_option :scope, type: :string, default: 'read_products'
  argument :params, :type => :hash, :default => {}

  def init
    @yarns = ['popper.js@1.16.1', 'acorn@8.7.0', 'jquery@3.6.0', 'bootstrap@4.6.0', 'bootstrap-icons@1.5.0', 'icheck-bootstrap@3.0.1']
    @kaminaris = ['first_page', 'gap', 'last_page', 'next_page', 'page', 'paginator', 'prev_page']
  end

  def exec
    yarn_camp
    gem_camp
    devise_camp
    arquivo_camp
  end
  private

  def yarn_camp
    puts ''
    puts "=========================== YARN PACKAGES ==========================="
    puts "====================================================================="
    @yarns.each do |y|
      run "yarn add #{y}"
    end
    puts "====================================================================="
  end
  
  def gem_camp
    puts ''
    puts "=============================== GEMS ==============================="
    puts "===================================================================="
    copy_file 'gem/gemfile', 'Gemfile', force: true
    run 'bundle install'
    puts "===================================================================="
  end

  def devise_camp
    puts ''
    puts "============================== DEVISE =============================="
    puts "===================================================================="
    run 'rails generate devise:install'
    run 'rails generate devise user'
    puts "===================================================================="
  end

  def arquivo_camp
    puts ''
    puts "============================= ARCHIVES ============================="
    puts "===================================================================="
      m = '20220208110938_create_'
      template  'assets/application.css', 'app/assets/stylesheets/application.css' , force: true
      copy_file 'assets/application.js', 'app/javascript/packs/application.js', force: true
      copy_file 'assets/adminlte.css'   , 'vendor/assets/stylesheets/adminlte.css'
      copy_file 'webpack/environment.js', 'config/webpack/environment.js', force: true
      copy_file 'assets/adminlte.js', 'vendor/assets/javascript/adminlte.js'
            
      # puts %x(rails g model dado first_name last_name nickname email unico)
      template  'mvc/migrate.rb'        , "db/migrate/#{m}dados.rb"                , force: true
      template  'mvc/model.rb'          , 'app/models/dado.rb'                     , force: true
      template  'mvc/controller.rb'     , 'app/controllers/dados_controller.rb'    , force: true
      copy_file 'mvc/view.rb'           , 'app/views/initial_config/index.html.erb', force: true
      
      @kaminaris.each do |k|
        copy_file "kaminari/_#{k}.html.erb", "app/views/kaminari/_#{k}.html.erb" , force: true
      end

      copy_file 'devise/devise.js', 'app/javascript/packs/devise.js'
      copy_file 'devise/config_devise.rb', 'config/initializers/devise.rb', force: true
      copy_file 'devise/users_controller.rb'                                    , 'app/controllers/users_controller.rb'
      copy_file 'devise/layout.html.erb'                                        , 'app/views/layouts/devise.html.erb'
      copy_file 'devise/views/users/confirmations/new.html.erb'                 , 'app/views/users/confirmations/new.html.erb'
      copy_file 'devise/views/users/mailer/confirmation_instructions.html.erb'  , 'app/views/users/mailer/confirmation_instructions.html.erb'
      copy_file 'devise/views/users/mailer/email_changed.html.erb'              , 'app/views/users/mailer/email_changed.html.erb'
      copy_file 'devise/views/users/mailer/password_change.html.erb'            , 'app/views/users/mailer/password_change.html.erb'
      copy_file 'devise/views/users/mailer/reset_password_instructions.html.erb', 'app/views/users/mailer/reset_password_instructions.html.erb'
      copy_file 'devise/views/users/mailer/unlock_instructions.html.erb'        , 'app/views/users/mailer/unlock_instructions.html.erb'
      copy_file 'devise/views/users/passwords/edit.html.erb'                    , 'app/views/users/passwords/edit.html.erb'
      copy_file 'devise/views/users/passwords/new.html.erb'                     , 'app/views/users/passwords/new.html.erb'
      copy_file 'devise/views/users/registrations/edit.html.erb'                , 'app/views/users/registrations/edit.html.erb'
      copy_file 'devise/views/users/registrations/new.html.erb'                 , 'app/views/users/registrations/new.html.erb'
      copy_file 'devise/views/users/sessions/new.html.erb'                      , 'app/views/users/sessions/new.html.erb'
      copy_file 'devise/views/users/shared/_error_messages.html.erb'            , 'app/views/users/shared/_error_messages.html.erb'
      copy_file 'devise/views/users/shared/_links.html.erb'                     , 'app/views/users/shared/_links.html.erb'
      copy_file 'devise/views/users/unlocks/new.html.erb'                       , 'app/views/users/unlocks/new.html.erb'

      copy_file 'routes.rb', 'config/routes.rb', force: true

      run 'rails db:migrate'
            
    puts "===================================================================="
  end
end
