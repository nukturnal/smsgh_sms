require "smsgh_sms/version"
require 'cgi'
require 'curb-fu'

module SmsghSms
  API_URL = "http://api.smsgh.com/v2/messages/send?"
  @@api_username = nil
  @@api_password = nil
  @@api_senderid = "SMSGHAPI"
  
  # Expects :msg, :to and an optional :from param
  # The :from param defaults to @@api_senderid when its omitted
  def self.push(options={})
    
    sender_id = options[:from].nil? ? @@api_senderid : options[:from]
    api_base = "#{API_URL}&username=#{@@api_username}&password=#{@@api_password}&from=#{sender_id}"
    
    url = "#{api_base}&text=#{CGI.escape(options[:msg])}&to=#{options[:to]}"
    raise ArgumentError, ':msg and :to params expected' if options[:msg].nil? || options[:to].nil?
    
    response = CurbFu.get(url)
    {:status => response.status, :notice => response.body}
    
  end
  
  
  def self.api_username=(api_username); @@api_username = api_username; end
  def self.api_username; @@api_username; end
  def self.api_password=(api_password); @@api_password = api_password; end
  def self.api_password; @@api_password; end
  def self.api_senderid=(api_senderid); @@api_senderid = api_senderid; end
  def self.api_senderid; @@api_senderid; end
  
end
