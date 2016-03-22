# include ::TheCommentsSubscriptions::MailerSettingsConcern
#
module TheCommentsSubscriptions
  module MailerSettingsConcern
    extend ActiveSupport::Concern

    class_methods do
      def smtp?
        ['smtp', 'letter_opener'].include?(::Settings.app.mailer.service)
      end
    end

    # SomeMailer.test_mail.delivery_method.settings
    #
    included do
      if smtp?
        _mailer = ::Settings.app.mailer

        default from: _mailer.smtp.default.user_name
        default template_path: "the_comments/mailers"

        def self.smtp_settings
          ::Settings.app.mailer.smtp.default.to_h
        end
      end
    end

    private

    def env_prefix
      'DEV => ' if Rails.env.development?
    end
  end
end