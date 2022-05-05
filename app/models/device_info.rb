class DeviceInfo < ApplicationRecord
  belongs_to :user

  def self.send_notification(tokens, payload, device_type='android')
    messenger = (device_type == 'android' ? PushMessenger::Gcm.new : PushMessenger::Ios.new)
    begin
      messenger.deliver("#{device_type}_app", tokens, payload)
    rescue Exception => error
      Rails.logger.debug error
    end
  end
end
