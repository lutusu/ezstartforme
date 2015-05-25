require 'rails/generators'

module Ez
	module Generators
		class SetUpGenerator < Rails::Generators::NamedBase
			source_root File.expand_path("../templates", __FILE__)

			desc 'This generator setups rails project templates '
			
			def initialize(args, *options)
				super
				f= File.new File.join SetUpGenerator::source_root,'Gemfile'
				@content = f.readlines
			end

			def create_gemfile_and_config
				copy_file 'Gemfile', 'Gemfile'
				template 'database.yml', 'config/database.yml'

				Bundler.with_clean_env do
					run "bundle install"
				end
				run 'rake rails:update:bin'
				
			end

			def set_up_gems
				generate	'simple_form:install --bootstrap'	if gems?	'simple_form'
				generate	'nested_form:install' 						if gems?	'nested_form'
				run 'compass install bootstrap -r bootstrap-sass'
				generate	'rspec:install'										if gems?	'rspec'
				generate	'html5:install'										if gems?	'compass-h5bp'
				rake	'haml:erb2haml'												if gems?	'haml-rails'
				run 	'cap install' 												if gems?  'capistrano'
				copy_file 'Capfile','Capfile'
			end

			private
			
			def gems? gem_name

				@content.each do |line|
					next if line.to_s.strip[0] == '#'
					return true if line.include? gem_name
				end
				false
			end
		end
	end
end
		
		
