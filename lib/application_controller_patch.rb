module ApplicationPatch
	def self.included(base)
		base.send(:include, InstanceMethods)
		base.class_eval do 

			alias_method :activate_normal_authorize, :authorize
  			alias_method :authorize, :check_if_auth_disabled

  			alias_method :activate_normal_check_login, :check_if_login_required
  			alias_method :check_if_login_required, :check_if_auth_dis_for_login

		end
	end

	module InstanceMethods

		def find_the_project
			project = nil
			if params[:id]
				project = Project.find(params[:id])
			end
			if params[:project_id]

				project = Project.find_by(:identifier => params[:project_id])
			end

			return project


		end

		def check_if_auth_disabled
			@project = find_the_project
			if @project != nil && @project.disable_auth && !@project.archived?
				return true
			else
				activate_normal_authorize
			end
		end

		def check_if_auth_dis_for_login 

			@project = find_the_project
			
			if @project != nil && @project.disable_auth
				return false
				
			else
				activate_normal_check_login
			end


		end


	end

end