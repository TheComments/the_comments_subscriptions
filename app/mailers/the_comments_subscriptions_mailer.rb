class TheCommentsSubscriptionsMailer < ActionMailer::Base
  include ::TheCommentsSubscriptions::MailerSettingsConcern

  # For LAYOUT
  # view_path + 'layouts' + layout_name
  prepend_view_path "#{ ::Rails.root }/app/views/app"
  prepend_view_path "#{ ::TheCommentsSubscriptions::Engine.root }/app/views/the_comments"
  layout 'mailer_layout'

  # For MAILER TEMPLATE
  # view_path + template_path + template_name
  # default template_path: [ 'the_comments/mailer' ]

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
