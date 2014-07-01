require "smsgh_sms/version"
require 'cgi'
require 'curb-fu'

module SmsghSms
  API_URL_V2 = "http://api.smsgh.com/v2/messages/send?"
  API_URL_V3 = "https://api.smsgh.com/v3/messages/send?"
  @@api_username = nil
  @@api_password = nil
  @@api_client_id = nil
  @@api_client_secret = nil
  @@api_senderid = "SMSGHAPI"
  
  # Expects :msg, :to and an optional :from param
  # The :from param defaults to @@api_senderid when its omitted
  def self.push(options={})
    
    sender_id = options[:from].nil? ? @@api_senderid : options[:from]
    api_base = nil
    url = nil

    if @@api_username != nil && @@api_password != nil
      api_base = "#{API_URL_V2}&username=#{@@api_username}&password=#{@@api_password}&from=#{sender_id}"
      url = "#{api_base}&text=#{CGI.escape(options[:msg])}&to=#{options[:to]}"
    end

    if @@api_client_id != nil && @@api_client_secret != nil
      api_base = "#{API_URL_V3}&ClientId=#{@@api_client_id}&ClientSecret=#{@@api_client_secret}&From=#{sender_id}"
      url = "#{api_base}&Content=#{CGI.escape(options[:msg])}&To=#{CGI.escape(options[:to])}"
    end
  
    raise ArgumentError, ':msg and :to params expected' if options[:msg].nil? || options[:to].nil?
    
    response = CurbFu.get(url)
    {:status => response.status, :notice => response.body}
    
  end
  
  
  def self.api_username=(api_username); @@api_username = api_username; end
  def self.api_username; @@api_username; end
  def self.api_password=(api_password); @@api_password = api_password; end
  def self.api_password; @@api_password; end
  def self.api_client_id=(api_client_id); @@api_client_id = api_client_id; end
  def self.api_client_id; @@api_client_id; end
  def self.api_client_secret=(api_client_secret); @@api_client_secret = api_client_secret; end
  def self.api_password; @@api_client_secret; end
  def self.api_senderid=(api_senderid); @@api_senderid = api_senderid; end
  def self.api_senderid; @@api_senderid; end
  
end