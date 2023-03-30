# frozen_string_literal: true

require 'thor'

class GenerateRailsNew < Thor
  desc 'generate', 'Build a new Rails application'
  def generate
    app_name = ask('What is the name of your application?', default: 'myapp')
    database = ask('Which database do you want to use? [sqlite3]:',
                   limited_to: %w[mysql postgresql sqlite3 oracle sqlserver jdbcmysql jdbcsqlite3 jdbcpostgresql jdbc], default: 'sqlite3')

    gitignore = yes?('Add a .gitignore file? [y/N]', :green)
    action_mailer = yes?('Add Action Mailer? [y/N]', :green)
    action_mailbox = yes?('Add Action Mailbox? [y/N]', :green)
    action_text = yes?('Add Action Text? [y/N]', :green)
    active_record = yes?('Add Active Record? [y/N]', :green)
    active_job = yes?('Add Active Job? [y/N]', :green)
    active_storage = yes?('Add Active Storage? [y/N]', :green)
    action_cable = yes?('Add Action Cable? [y/N]', :green)

    asset_pipeline = ask('Choose your asset pipeline? [sprockets]:', limited_to: %w[sprockets propshaft],
                                                                     default: 'sprockets')

    javascript = ask('Choose your JavaScript approach? [importmap]:', limited_to: %w[importmap webpack esbuild rollup],
                                                                      default: 'importmap')

    css = ask('Choose your CSS preprocessor? [sass]:', limited_to: %w[tailwind bootstrap bulma postcss sass],
                                                       default: 'sass')

    bundle = yes?('Run bundle install? [y/N]', :green)

    command = "rails new #{app_name} -d #{database}"
    command << ' --skip-git' unless gitignore
    command << ' --skip-action-mailer' unless action_mailer
    command << ' --skip-action-mailbox' unless action_mailbox
    command << ' --skip-action-text' unless action_text
    command << ' --skip-active-record' unless active_record
    command << ' --skip-active-job' unless active_job
    command << ' --skip-active-storage' unless active_storage
    command << ' --skip-action-cable' unless action_cable
    command << " -a #{asset_pipeline}" unless asset_pipeline == 'sprockets'
    command << " -j #{javascript}" unless javascript == 'importmap'
    command << " -c #{css}" unless css == 'sass'
    command << ' --skip-bundle' unless bundle

    puts command
  end
end
