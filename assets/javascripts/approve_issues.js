/**
 * Approve Issues
 */
var approve_issues = {

  updateCount: function (count, target) {
    $(".approve-count", "#approve-target-" + target).text(count);
  },

  updateList: function (users, target) {
    let list = [];
    users.forEach(user => {
      list.push(user.login);
    });
    $(".approve-list", "#approve-target-" + target).text(list.join(', '));
  },

  toggleButtons: function (status) {
    if (typeof status === 'undefined') {
      $("#approval-issues-section input.status-edit").show();
      $("#approval-issues-section input.status-cancel").hide();
    }
    else {
      $("#approval-issues-section input.status-edit").hide();
      $("#approval-issues-section input.status-cancel").show();
    }
  }

};
