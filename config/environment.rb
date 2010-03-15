# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

DEFAULT_TIME_ZONE = 'uk'

Rails::Initializer.run do |config|
  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  config.gem "inherited_resources", :source => 'http://gemcutter.org', :version => "=1.0.3"
  config.gem "has_scope", :source => 'http://gemcutter.org'
  config.gem "responders", :source => 'http://gemcutter.org'
  config.gem "pacecar", :source => 'http://gemcutter.org'
  config.gem 'unicode'
  config.gem "i18n", :source => 'http://gemcutter.org', :version => "=0.2.0"
  config.gem "romanvbabenko-ukrainian", :lib => "ukrainian", :source => "http://gems.github.com", :version => ">= 0.2.1"
  config.gem 'will_paginate', :version => '~> 2.3.11', :source => 'http://gemcutter.org'
  config.gem 'bullet', :source => 'http://gemcutter.org'
  config.gem 'smurf', :source => 'http://gemcutter.org' 
  config.gem 'hoptoad_notifier'
  config.gem 'formtastic'
  config.gem 'clearance'
  config.gem 'searchlogic'
  config.gem 'russian', :source => 'http://gemcutter.org'
  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :action_mailer, :active_resource ]

  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Kyev' 

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = DEFAULT_TIME_ZONE
  
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = DEFAULT_TIME_ZONE.to_sym
end

date_time_formats = {
  :day_month_year => '%d-%m-%y',
  :day_month_year_with_time => '%H:%M %d-%m-%y',
  :with_time => '%H:%M'
}

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(date_time_formats)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(date_time_formats)

ActionView::Base.field_error_proc = Proc.new{ |html_tag, instance| "<span class=\"field_with_errors\">#{html_tag}</span>" }  

require "#{Rails.root}/lib/utils.rb"
require "#{Rails.root}/lib/routing.rb"
#require "#{Rails.root}/lib/transliterate.rb"

Haml::Template::options[:ugly] = true if Rails.env == 'production'

$KCODE = 'u'
require 'jcode'

def log_to(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end

class ActiveSupport::Multibyte::Chars
  def titleize
    self.split(/(\s)/).collect { |e| e.mb_chars.capitalize.to_s }.join($1)
  end
end

if defined? IRB
  log_to STDOUT
  require 'hirb'
  Hirb.enable
end 