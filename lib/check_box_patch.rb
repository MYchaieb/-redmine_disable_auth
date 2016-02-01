class InsertCheckBowAuth < Redmine::Hook::ViewListener

	def view_projects_form(context = {})
		project = context[:project]

		tag = context[:form].check_box :disable_auth
		# tag =  calendar_for('issue_delivery_date')

		if User.current.allowed_to?(:manage_disable_auth, project)
			return content_tag(:p, tag)
		else
			return nil
		end
		
	end

end