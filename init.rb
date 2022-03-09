require 'redmine'

Rails.configuration.to_prepare do
  RedmineApproveIssues.setup
end

Redmine::Plugin.register :redmine_approve_issues do
  name 'Redmine Approve Issues'
  author 'Georepublic'
  author_url 'https://github.com/georepublic'
  url 'https://github.com/gtt-project/redmine_approve_issues'
  description 'Enables simple approval for Redmine issues'
  version '0.1.0'

  requires_redmine :version_or_higher => '4.0.0'

  settings(
    default: {
      'approve_allow_abstain' => false,
      'approve_allow_reject' => false
    },
    partial: 'approve_issues/settings'
  )

  project_module :approve_issues do
    permission :make_approval,  {:issues => :make_approval }, :require => :loggedin
    permission :view_approvals, {:issues => :view_approvals}, :require => :loggedin
    permission :view_approvers, {:issues => :view_approvers}, :require => :loggedin
  end

end
