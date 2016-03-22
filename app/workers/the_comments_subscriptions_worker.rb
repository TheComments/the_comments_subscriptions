# ::TheCommentsSubscriptionsWorker.perform_async('x@x.ru', Comment.last.id)
# ::TheCommentsSubscriptionsWorker.perform_in(15.seconds, 'x@x.ru', Comment.last.id)

class TheCommentsSubscriptionsWorker
  include Sidekiq::Worker

  sidekiq_options queue: :the_comments_jobs,
                  backtrace: true,
                  retry: false

  def perform(email, comment_id)
    comment = ::Comment.find(comment_id)
    ::TheCommentsSubscriptionsMailer.notificate(email, comment).deliver_now
  end
end