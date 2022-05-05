class User < ApplicationRecord
  has_many :device_infos

  def send_notification_to_user(title, description)
    payload = {payload: { title: title , description: description } }
    android_condition = "device_type = 'android' and user_id = #{id.to_i}"
    ios_condition = "device_type = 'ios' and user_id = #{id.to_i}"
    send_notification(payload, android_condition, 'android')
    send_notification(payload, ios_condition, 'ios')
  end

  def send_notification(payload, condition, device_type)
    tokens = DeviceInfo.where(condition).pluck(:device_token).compact
      DeviceInfo.send_notification(tokens, payload, device_type)
  end
end
