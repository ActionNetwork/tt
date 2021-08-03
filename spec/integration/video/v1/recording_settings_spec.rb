##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'RecordingSettings' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.recording_settings().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/RecordingSettings/Default',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "string",
          "aws_credentials_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "encryption_key_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "aws_s3_url": "https://my-super-duper-bucket.s3.amazonaws.com/my/path/",
          "aws_storage_enabled": true,
          "encryption_enabled": true,
          "url": "https://video.twilio.com/v1/RecordingSettings/Default"
      }
      ]
    ))

    actual = @client.video.v1.recording_settings().fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.recording_settings().create(friendly_name: 'friendly_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/RecordingSettings/Default',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "aws_credentials_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "encryption_key_sid": "CRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "aws_s3_url": "https://my-super-duper-bucket.s3.amazonaws.com/my/path/",
          "aws_storage_enabled": true,
          "encryption_enabled": true,
          "url": "https://video.twilio.com/v1/RecordingSettings/Default"
      }
      ]
    ))

    actual = @client.video.v1.recording_settings().create(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end
end