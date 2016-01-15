class TheCommentsSubscriptionsMailer < ActionMailer::Base
  include ::TheCommentsSubscriptions::MailerSettingsConcern

  # TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_now
  # TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_later
  # TheCommentsSubscriptionsMailer.notificate("test@test.com", Comment.last).deliver_now
  def notificate email, comment
    @email       = email
    @comment     = comment
    @commentable = comment.commentable

    mail(
      to: email,
      subject: "TheComments::New Comment",
      template_name: "new_comment"
    )
  end
end
