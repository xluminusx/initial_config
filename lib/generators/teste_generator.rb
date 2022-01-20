class TestGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :scope, type: :string, default: 'read_products'
  argument :params, :type => :hash, :default => {}

  def exe
    yarn_camp
  end

  private

  def yarn_camp
    puts ''
    puts "========================= YARN PACKAGES ========================="
    puts "================================================================="
    if @action == "i"
      show_spinner("installing popperJs... ") {%x(yarn add popper.js@1.16.1)}
      show_spinner("installing acorn...    ") {%x(yarn add acorn@8.7.0)}
      show_spinner("installing jquery...   ") {%x(yarn add jquery@3.6.0)}
      show_spinner("installing bootstrap...") {%x(yarn add bootstrap@4.6.0)}
      show_spinner("installing icones...   ") {%x(yarn add bootstrap-icons@1.5.0)}
      @bootstrap = "\n *= require bootstrap/dist/css/bootstrap\n"
      @icons =     "*= require bootstrap-icons/font/bootstrap-icons"
    elsif @action == "d"
      show_spinner("Uninstalling bootstrap...") {%x(yarn remove bootstrap)}
      show_spinner("Uninstalling icones...   ") {%x(yarn remove bootstrap-icons)}
      show_spinner("Uninstalling jquery...   ") {%x(yarn remove jquery)}
      show_spinner("Uninstalling popper...   ") {%x(yarn remove popper.js)}
      show_spinner("Uninstalling acorn...    ") {%x(yarn remove acorn)}
      @bootstrap = "*="
      @icons = "*="
    end
    puts "================================================================="
  end

  def arquivo_camp
    puts ''
    puts "=========================== ARCHIVES ==========================="
    puts "================================================================"
    if params['install'] == "full"
      m = '20220120122130_create_'
      template  'assets/application.rb', 'app/assets/stylesheets/application.css', force: true
      copy_file 'gem/gemfile', 'Gemfile', force: true
      copy_file 'devise/layout.html.erb', 'app/views/layouts/devise.html.erb', force: true
      template  'mvc/migrate.rb'        , "db/migrate/#{m}dados.rb"       , force: true
      template  'mvc/model.rb'          , 'app/models/dado.rb'           , force: true
      template  'mvc/controller.rb'     , 'app/controllers/dados_controller.rb', force: true
      copy_file 'mvc/view.rb'           , 'app/views/initial_config/index.html.erb'     , force: true
      route 'resources :dados'
    elsif params['uninstall'] == "full"
      remove_file 'lib/generators/Teste.css'
      remove_file 'lib/generators/Gemfile'
      remove_file 'lib/generators/devise.html.erb'
    end
    puts "================================================================"
  end

  def show_spinner(mgs_start, mgs_end = "Concluído com sucesso!" )
    spinner = TTY::Spinner.new("[:spinner] #{mgs_start} ")
    spinner.auto_spin
    yield
    sleep 1
    spinner.success("(#{mgs_end})")
  end
end