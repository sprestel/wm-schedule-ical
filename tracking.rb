
class Tracking < ActiveRecord::Base
  enum download_type: [ :ics, :rss ]
  
  validate :ip_checker, on: :create
  
  SKIP_IPS = %w{127.0.0.1}
   
  def ip_checker
    errors.add(:ip, "local ip's will be ignored!!") if SKIP_IPS.include?(self.ip)
  end
end