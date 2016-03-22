# ::TheCommentsSubscriptionsWorker.perform_async('zykin-ilya@ya.ru', Comment.last.id)
# ::TheCommentsSubscriptionsWorker.perform_in(2.seconds, 'zykin-ilya@ya.ru', Comment.last.id)

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