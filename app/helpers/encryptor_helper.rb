module EncryptorHelper
  class << self
    def encryptor
      skb = Rails.application.secrets.secret_key_base
      @encryptor ||= ActiveSupport::MessageEncryptor.new(skb)
    end

    def crypt str
      Base64.urlsafe_encode64 self.encryptor.encrypt_and_sign(str.to_s)
    end

    def decrypt str
      self.encryptor.decrypt_and_verify Base64.urlsafe_decode64(str.to_s)
    end
  end
end
