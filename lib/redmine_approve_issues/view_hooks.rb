module RedmineApproveIssues
  class ViewHooks < Redmine::Hook::ViewListener

    render_on :view_layouts_base_html_head, inline: <<-END
      <%= stylesheet_link_tag 'approve_issues', :plugin => 'redmine_approve_issues' %>
      <%= javascript_include_tag 'approve_issues', :plugin => 'redmine_approve_issues' %>
    END

    render_on :view_issues_show_details_bottom,
      :partial => 'view_issues/show_details_bottom'

  end
end
