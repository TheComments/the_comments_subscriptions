# retry: true,
# backtrace: true

# TheCommentsSubscriptionsJob.perform_later(email, comment_id)
# TheCommentsSubscriptionsJob.perform_now(email, comment_id)

class TheCommentsSubscriptionsJob < ActiveJob::Base
  queue_as :the_comments_jobs

  def perform(email, comment_id)
    comment = ::Comment.find(comment_id)
    ::TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_now
  end
end