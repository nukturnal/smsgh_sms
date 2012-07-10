require "smsgh_sms/version"
require 'cgi'

module SmsghSms
  API_URL = "http://api.smsgh.com/v2/messages/send?"
  @@api_username = nil
  @@api_password = nil
  @@api_senderid = "SMSGH-API"
  
  # Expects :msg, :to and an optional :from param
  # The :from param defaults to @@api_senderid when its omitted
  
  def self.push(options={})
    api_base = "#{API_URL}&username=#{@@api_username}&password=#{@@api_password}&from=#{@@api_senderid}"
    url = "#{api_base}&text=#{CGI.escape(options[:msg])}&to=#{options[:to]}"
    raise ArgumentError, ':msg and :to params expected' if options[:msg].nil? || options[:to].nil?
    response = CurbFu.get(url)
    {:status => response.status, :message => response.body}
  end
  
  def self.api_url(url=''); @@api_base + url; end
  def self.api_username=(api_username); @@api_username = api_username; end
  def self.api_username; @@api_username; end
  def self.api_password=(api_password); @@api_password = api_password; end
  def self.api_password; @@api_password; end
  def self.api_senderid=(api_senderid); @@api_senderid = api_senderid; end
  def self.api_senderid; @@api_senderid; end
end
