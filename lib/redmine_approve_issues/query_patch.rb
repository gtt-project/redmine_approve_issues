module RedmineApproveIssues
  module QueryPatch

    def self.apply
      # unless IssueQuery < self
      #   IssueQuery.prepend self
      # end
    end

    # def self.prepended(base)
    # end

    # def self.included(base)
    #   base.class_eval do
    #     before_validation :display_approvals

    #     def display_approvals
    #       # if User.current.allowed_to?(:view_approvals, nil, :global => true)
    #         self.available_columns << QueryColumn.new(
    #           ApproveIssues.where('approval > 0 AND issue_id=?', issue.id).count,
    #           :caption => 'Caption'
    #         )
    #       # end
    #     end
    #   end
    # end

    # def available_columns
    #   return @available_columns if @available_columns

    #   super.tap do |columns|

    #     if project.nil? or project.module_enabled?('approve_issues')
    #       columns << QueryColumn.new(
    #         ApproveIssues.where('approval > 0 AND issue_id=?', issue.id).count,
    #         :caption => 'TEST Column'
    #       )
    #     end

    #   end
    # end

    def sum_approve(issue)
      if User.current.allowed_to?(:view_approvals, nil, :global => true)
        ApproveIssues.where('approval > 0 AND issue_id=?', issue.id).count
      else
        l(:field_content_restricted)
      end
    end

    def sum_abstain(issue)
      if User.current.allowed_to?(:view_approvals, nil, :global => true)
        ApproveIssues.where('approval = 0 AND issue_id=?', issue.id).count
      else
        l(:field_content_restricted)
      end
    end

    def sum_reject(issue)
      if User.current.allowed_to?(:view_approvals, nil, :global => true)
        ApproveIssues.where('approval < 0 AND issue_id=?', issue.id).count
      else
        l(:field_content_restricted)
      end
    end

  end
end
