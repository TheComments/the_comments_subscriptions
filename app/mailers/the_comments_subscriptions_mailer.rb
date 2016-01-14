class TheCommentsSubscriptionsMailer < ActionMailer::Base
  default from: ::TheCommentsBase.config.default_mailer_email

  # TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_now
  # TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_later
  def notificate email, comment
    @email       = email
    @comment     = comment
    @commentable = comment.commentable

    mail(
      to: email,
      subject: "TheComments::New Comment",
      template_path: ('the_comments/mailers'),
      template_name: "new_comment"
    )
  end
end
