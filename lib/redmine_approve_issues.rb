require 'redmine_approve_issues/view_hooks'
require_dependency 'redmine_approve_issues/query_column'

module RedmineApproveIssues

  def self.setup
    RedmineApproveIssues::QueryPatch.apply
    issue_query = (IssueQuery rescue Query)
    issue_query.add_available_column(RedmineApproveIssues_QueryColumn.new(:sum_approve, :sortable => '(SELECT count(approval) FROM approve_issues WHERE approval > 0 AND issue_id=issues.id )'))
    issue_query.add_available_column(RedmineApproveIssues_QueryColumn.new(:sum_abstain, :sortable => '(SELECT count(approval) FROM approve_issues WHERE approval = 0 AND issue_id=issues.id )'))
    issue_query.add_available_column(RedmineApproveIssues_QueryColumn.new(:sum_reject,  :sortable => '(SELECT count(approval) FROM approve_issues WHERE approval < 0 AND issue_id=issues.id )'))
    Issue.send(:include, RedmineApproveIssues::QueryPatch)
  end

  def self.settings
    Setting.plugin_redmine_approve_issues
  end

end
