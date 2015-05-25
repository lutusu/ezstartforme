require 'spec_helper'

module Ez	
	module Generators	
		describe SetUpGenerator do 
			before :each do
				@g = SetUpGenerator.new ['ezstartforme']
				root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
				Dir.chdir File.join(root,'lib','generators','ez')
			end
			it 'identifies if a gem is presented' do

				expect(@g.send 'gems?', 'simple_form').to be true
				expect(@g.send 'gems?', 'dwadwad').to be false
				expect(@g.send 'gems?', 'byebug').to be true
				expect(@g.send 'gems?', 'stripe').to be false	
			end
		end
	end
end
