##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Invite' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .invites('INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Invites/INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "identity": "identity",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites/INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .invites('INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .invites.create(identity: 'identity')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Identity' => 'identity', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Invites',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "created_by": "created_by",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "identity": "identity",
          "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites/INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .invites.create(identity: 'identity')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .invites.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Invites',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "invites": [],
          "meta": {
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites?Identity=identity&PageSize=50&Page=0",
              "key": "invites",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites?Identity=identity&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .invites.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "invites": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "created_by": "created_by",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "identity": "identity",
                  "role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites/INaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites?Identity=identity&PageSize=50&Page=0",
              "key": "invites",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Invites?Identity=identity&PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .invites.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                             .invites('INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Channels/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Invites/INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.ip_messaging.v2.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .channels('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                    .invites('INXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end