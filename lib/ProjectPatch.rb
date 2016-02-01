module ProjectPatch
	def self.included(base)
		base.send(:include, InstanceMethods)
		base.class_eval do 

			unloadable

			safe_attributes 'disable_auth'
		     
		end
	end

	module InstanceMethods
	end

end