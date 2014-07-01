# SmsghSms

This is a ruby wrapper that abstracts the SMSGH's SMS API. This gem has extra garnishing to make smsing via Ruby more tasteful and less painful.

## Installation

Add this line to your application's Gemfile:

    gem 'smsgh_sms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsgh_sms

## Usage

Setup your SMSGH API username and password

If you are using the old API (V2) then

	SmsghSms_Old.api_username = "YOUR_USERNAME"
	SmsghSms_Old.api_password = "YOUR_PASSWORD"

If you are using the new API (V3) then

	SmsghSms.api_client_id = "YOUR_CLIENT_ID"
	SmsghSms.api_client_secret = "YOUR_CLIENT_SECRET"
	
Optionally set global Sender ID

	SmsghSms_Old.api_senderid = "YOUR_SENDERID" for V2 of the API
	SmsghSms.api_senderid = "YOUR_SENDERID" for V3 of the API
	
Sending an SMS Message

	SmsghSms.push(:to => 'PHONE-NUMBER', :msg => "Your SMS Message goes here")
	
How to override the global SENDER ID config

	SmsghSms.push(:to => 'PHONE-NUMBER', :msg => "Your SMS Message goes here", :from => "SENDERID")
	
Sample Results Returned

	{:status=>200, :notice=>"OK: 62357215"}
	
Any returned status code other than 200 is a failed response.

## About SMSGH

SMSGH is the premier messaging company in Ghana. Find out more about them at http://smsgh.com

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
