require "smsgh_sms/version"
require 'cgi'
require 'http'
require 'nokogiri'

module SmsghSms
  @@api_username = nil
  @@api_password = nil
  @@api_client_id = nil
  @@api_client_secret = nil
  @@api_senderid = "SMSGHAPI"
  ROOT_URL = "api.smsgh.com"

  # Expects :msg, :to and an optional :from param
  # The :from param defaults to @@api_senderid when its omitted
  def self.push(options={})

    sender_id = options[:from].nil? ? @@api_senderid : options[:from]
    response = nil
    message = options[:msg]

    raise ArgumentError, ':msg and :to params expected' if message.nil? || options[:to].nil?

    message = Nokogiri::HTML.parse(message).text

    if @@api_username != nil && @@api_password != nil
      response = HTTP.get("#{ROOT_URL}/v2/messages/send", params: {from: sender_id, to: options[:to], text: message, username: @@api_username, password: @@api_password})
    end

    if @@api_client_id != nil && @@api_client_secret != nil
      response = HTTP.get("#{ROOT_URL}/v3/messages/send", params: {From: sender_id, To: options[:to], Content: message, ClientId: @@api_client_id, ClientSecret: @@api_client_secret})
    end
    { status: response.code, notice: response.body }
  end


  def self.api_username=(api_username); @@api_username = api_username; end
  def self.api_username; @@api_username; end

  def self.api_password=(api_password); @@api_password = api_password; end
  def self.api_password; @@api_password; end

  def self.api_client_id=(api_client_id); @@api_client_id = api_client_id; end
  def self.api_client_id; @@api_client_id; end

  def self.api_client_secret=(api_client_secret); @@api_client_secret = api_client_secret; end
  def self.api_client_secret; @@api_client_secret; end

  def self.api_senderid=(api_senderid); @@api_senderid = api_senderid; end
  def self.api_senderid; @@api_senderid; end

end
