require 'redmine'

require 'dispatcher' unless Rails::VERSION::MAJOR >= 3
require_dependency 'ProjectPatch' 
require_dependency 'check_box_patch'
require_dependency 'application_controller_patch'




ActionDispatch::Callbacks.to_prepare do
	require_dependency 'project'
	require_dependency 'application_controller'
	Project.send(:include, ProjectPatch)
	ApplicationController.send(:include, ApplicationPatch)
end

Redmine::Plugin.register :redmine_disable_auth do
  name 'Redmine Disable Auth plugin'
  author 'Chaieb Yassine'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'


  permission :manage_disable_auth, {}
end
