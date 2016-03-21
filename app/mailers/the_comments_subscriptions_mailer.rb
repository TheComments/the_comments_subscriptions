class TheCommentsSubscriptionsMailer < ActionMailer::Base
  include ::TheCommentsSubscriptions::MailerSettingsConcern

  # For LAYOUT
  prepend_view_path "#{ ::TheCommentsSubscriptions::Engine.root }/app/views/the_comments"
  layout 'mailers/the_comments_layout'

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # INJECT FROM APP VIEW ENGINE
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  voiceless do
    # Add View Helper for Mailer Preview Fix
    add_template_helper(MailerImageTagHelper)

    prepend_view_path "#{ ::AppViewEngine::Engine.root }/app/views"
    include ::AppViewEngine::MailerAttachments
  end
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # ~ INJECT FROM APP VIEW ENGINE
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

    @subject = "#{ env_prefix }Новый комментарий на сайте"

    mail(to: @email, subject: @subject)
  end
end
