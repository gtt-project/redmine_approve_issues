class ApproveIssues < ActiveRecord::Base
  unloadable

  # Every approval belongs to a user and an issue
  belongs_to :user
  belongs_to :issue

  def self.getMy(issue_id)
    my_approval = nil
    begin
     @approval = ApproveIssues.find_by!("issue_id = ? AND user_id = ?", issue_id, User.current.id)
     my_approval = @approval.approval
    rescue ActiveRecord::RecordNotFound
     my_approval = nil
    end
    my_approval
  end

  def self.getCount(issue_id, target)
    case target
    when "approve"
      where("issue_id = ? AND approval > 0", issue_id).count
    when "abstain"
      where("issue_id = ? AND approval = 0", issue_id).count
    when "reject"
      where("issue_id = ? AND approval < 0", issue_id).count
    end
  end

  def self.getList(issue_id, target)
    case target
    when "approve"
      find_by_sql( ["SELECT u.login, u.firstname, u.lastname, u.id FROM approve_issues a LEFT JOIN users u ON (u.id = a.user_id) WHERE (a.issue_id = ? AND a.approval > 0) ORDER BY u.login ASC", issue_id] ).to_json.html_safe
    when "abstain"
      find_by_sql( ["SELECT u.login, u.firstname, u.lastname, u.id FROM approve_issues a LEFT JOIN users u ON (u.id = a.user_id) WHERE (a.issue_id = ? AND a.approval = 0) ORDER BY u.login ASC", issue_id] ).to_json.html_safe
    when "reject"
      find_by_sql( ["SELECT u.login, u.firstname, u.lastname, u.id FROM approve_issues a LEFT JOIN users u ON (u.id = a.user_id) WHERE (a.issue_id = ? AND a.approval < 0) ORDER BY u.login ASC", issue_id] ).to_json.html_safe
    end
  end

end
