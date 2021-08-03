##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Sync < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SyncStreamContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class StreamMessageList < ListResource
              ##
              # Initialize the StreamMessageList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service Instance
              #   that hosts this Message Stream.
              # @param [String] stream_sid The unique 34-character SID identifier of the Message
              #   Stream.
              # @return [StreamMessageList] StreamMessageList
              def initialize(version, service_sid: nil, stream_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, stream_sid: stream_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Streams/#{@solution[:stream_sid]}/Messages"
              end

              ##
              # Retrieve a single page of StreamMessageInstance records from the API.
              # Request is executed immediately.
              # @param [Hash] data The body of the Stream Message. Arbitrary JSON object,
              #   maximum size 4KB.
              # @return [StreamMessageInstance] Newly created StreamMessageInstance
              def create(data: nil)
                data = Twilio::Values.of({'Data' => Twilio.serialize_object(data), })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                StreamMessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    stream_sid: @solution[:stream_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Sync.V1.StreamMessageList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class StreamMessagePage < Page
              ##
              # Initialize the StreamMessagePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [StreamMessagePage] StreamMessagePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of StreamMessageInstance
              # @param [Hash] payload Payload response from the API
              # @return [StreamMessageInstance] StreamMessageInstance
              def get_instance(payload)
                StreamMessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    stream_sid: @solution[:stream_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Sync.V1.StreamMessagePage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class StreamMessageInstance < InstanceResource
              ##
              # Initialize the StreamMessageInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service Instance
              #   that hosts this Message Stream.
              # @param [String] stream_sid The unique 34-character SID identifier of the Message
              #   Stream.
              # @return [StreamMessageInstance] StreamMessageInstance
              def initialize(version, payload, service_sid: nil, stream_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {'sid' => payload['sid'], 'data' => payload['data'], }
              end

              ##
              # @return [String] Stream Message SID.
              def sid
                @properties['sid']
              end

              ##
              # @return [Hash] Stream Message body.
              def data
                @properties['data']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Sync.V1.StreamMessageInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Sync.V1.StreamMessageInstance>"
              end
            end
          end
        end
      end
    end
  end
end