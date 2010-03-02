config_file = "#{RAILS_ROOT}/config/seo.yml"
raise "Sorry, you must have #{config_file}" unless File.exists?(config_file)
SEO_INFORMATION = YAML.load_file(config_file) 