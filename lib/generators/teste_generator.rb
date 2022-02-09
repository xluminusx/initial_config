class TesteGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)
  class_option :scope, type: :string, default: 'read_products'
  argument :params, :type => :hash, :default => {}

  def init
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
    puts "========================= YARN PACKAGES ========================="
    puts "================================================================="
    puts %x(yarn add popper.js@1.16.1)
    puts %x(yarn add acorn@8.7.0)
    puts %x(yarn add jquery@3.6.0)
    puts %x(yarn add bootstrap@4.6.0)
    puts %x(yarn add bootstrap-icons@1.5.0)
    puts %x(yarn add icheck-bootstrap@3.0.1)
    puts "================================================================="
  end
  
  def gem_camp
    puts ''
    puts "============================= GEMS ============================="
    puts "================================================================"
    copy_file 'gem/gemfile', 'Gemfile', force: true
    puts %x(bundle install)
    puts "================================================================"
  end

  def devise_camp
    puts ''
    puts "============================ DEVISE ============================"
    puts "================================================================"
    puts %x(rails generate devise:install)
    puts %x(rails generate devise user)
    puts %x(rails db:migrate)
    puts "================================================================"
  end

  def arquivo_camp
    puts ''
    puts "=========================== ARCHIVES ==========================="
    puts "================================================================"
      m = '20220208110938_create_'
      template  'assets/application.css', 'app/assets/stylesheets/application.css' , force: true
      copy_file 'assets/adminlte.css'   , 'vendor/assets/stylesheets/adminlte.css'
      # copy_file 'gem/gemfile'           , 'Gemfile'                                , force: true
      copy_file 'devise/layout.html.erb', 'app/views/layouts/devise.html.erb'      , force: true
      
      template  'mvc/migrate.rb'        , "db/migrate/#{m}dados.rb"                , force: true
      template  'mvc/model.rb'          , 'app/models/dado.rb'                     , force: true
      template  'mvc/controller.rb'     , 'app/controllers/dados_controller.rb'    , force: true
      copy_file 'mvc/view.rb'           , 'app/views/initial_config/index.html.erb', force: true
            
      copy_file 'kaminari/first.rb'     , 'app/views/kaminari/_first_page.html.erb', force: true 
      copy_file 'kaminari/gap.rb'       , 'app/views/kaminari/_gap.html.erb'       , force: true
      copy_file 'kaminari/last.rb'      , 'app/views/kaminari/_last_page.html.erb' , force: true
      copy_file 'kaminari/next.rb'      , 'app/views/kaminari/_next_page.html.erb' , force: true
      copy_file 'kaminari/page.rb'      , 'app/views/kaminari/_page.html.erb'      , force: true
      copy_file 'kaminari/paginator.rb' , 'app/views/kaminari/_paginator.html.erb' , force: true
      copy_file 'kaminari/prev.rb'      , 'app/views/kaminari/_prev_page.html.erb' , force: true

      # copy_file 'devise/migrate.rb'         , "db/migrate/#{(m[0..13].to_i + 1).to_s}_devise_create_users.rb"
      copy_file 'devise/model_user.rb'      , 'app/models/user.rb'
      copy_file 'devise/users_controller.rb', 'app/controllers/users_controller.rb'
      copy_file 'devise/layout.html.erb'    , 'app/views/layouts/devise.html.erb'
      copy_file 'devise/views/users/confirmations/new.html.erb', 'app/views/users/confirmations/new.html.erb'
      copy_file 'devise/views/users/mailer/confirmation_instructions.html.erb', 'app/views/users/mailer/confirmation_instructions.html.erb'
      copy_file 'devise/views/users/mailer/email_changed.html.erb', 'app/views/users/mailer/email_changed.html.erb'
      copy_file 'devise/views/users/mailer/password_change.html.erb', 'app/views/users/mailer/password_change.html.erb'
      copy_file 'devise/views/users/mailer/reset_password_instructions.html.erb', 'app/views/users/mailer/reset_password_instructions.html.erb'
      copy_file 'devise/views/users/mailer/unlock_instructions.html.erb', 'app/views/users/mailer/unlock_instructions.html.erb'
      copy_file 'devise/views/users/passwords/edit.html.erb', 'app/views/users/passwords/edit.html.erb'
      copy_file 'devise/views/users/passwords/new.html.erb', 'app/views/users/passwords/new.html.erb'
      copy_file 'devise/views/users/registrations/edit.html.erb', 'app/views/users/registrations/edit.html.erb'
      copy_file 'devise/views/users/registrations/new.html.erb', 'app/views/users/registrations/new.html.erb'
      copy_file 'devise/views/users/sessions/new.html.erb', 'app/views/users/sessions/new.html.erb'
      copy_file 'devise/views/users/shared/_error_messages.html.erb', 'app/views/users/shared/_error_messages.html.erb'
      copy_file 'devise/views/users/shared/_links.html.erb', 'app/views/users/shared/_links.html.erb'
      copy_file 'devise/views/users/unlocks/new.html.erb', 'app/views/users/unlocks/new.html.erb'

      copy_file 'routes.rb', 'config/routes.rb', force: true
            
    puts "================================================================"
  end
end
