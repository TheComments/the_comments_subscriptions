# include ::TheCommentsSubscriptions::MailerSettingsConcern
#
module TheCommentsSubscriptions
  module MailerSettingsConcern
    extend ActiveSupport::Concern

    class_methods do
      def smtp?
        ['smtp', 'letter_opener'].include?(Settings.app.mailer.service)
      end
    end

    included do
      default template_path: "the_comments/mailers"

      # SomeMailer.test_mail.delivery_method.settings
      #
      if smtp?
        default bcc:  Settings.app.mailer.admin_email
        default from: Settings.app.mailer.smtp.default.user_name

        def self.smtp_settings
          Settings.app.mailer.smtp.default.to_h
        end
      end
    end

    private

    def env_prefix
      'DEV => ' if Rails.env.development?
    end

    def default_from
      Settings.app.mailer.smtp.default.user_name if smtp?
    end
  end
end