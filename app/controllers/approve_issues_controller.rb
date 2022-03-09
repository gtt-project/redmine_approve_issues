class ApproveIssuesController < ApplicationController

  # respond_to :html, :js
  unloadable

  def submit
    # Auto loads /app/views/approve_issues/submit.js.erb
    @status = nil
    @issue_id = params[:issue_id]

    case params[:status]
    when "approve"
      @status = 1
    when "abstain"
      @status = 0
    when "reject"
      @status = -1
    when "cancel"
      @status = nil
    end

    begin
      @record = ApproveIssues.find_by!("issue_id = ? AND user_id = ?", @issue_id, User.current.id)
      if @status.nil?
        @record.destroy
      else
        @record.approval = @status
        @record.save
      end
    rescue ActiveRecord::RecordNotFound
      unless @status.nil?
        @record = ApproveIssues.new
        @record.user_id  = User.current.id
        @record.issue_id = @issue_id
        @record.approval = @status
        @record.save
      end
    end

    # TODO: Evaluate writing to the issue journal
    # issue = Issue.find(@issue_id)
    # journal = issue.init_journal(User.current.id, 'Approval log message')
    # journal.save
  end

end
