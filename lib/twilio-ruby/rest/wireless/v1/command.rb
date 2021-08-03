##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Wireless < Domain
      class V1 < Version
        class CommandList < ListResource
          ##
          # Initialize the CommandList
          # @param [Version] version Version that contains the resource
          # @return [CommandList] CommandList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Commands"
          end

          ##
          # Lists CommandInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] sim Only return Commands to or from this SIM.
          # @param [command.Status] status Only return Commands with this status value.
          # @param [command.Direction] direction Only return Commands with this direction
          #   value.
          # @param [command.Transport] transport Only return Commands with this transport
          #   value.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(sim: :unset, status: :unset, direction: :unset, transport: :unset, limit: nil, page_size: nil)
            self.stream(
                sim: sim,
                status: status,
                direction: direction,
                transport: transport,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams CommandInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] sim Only return Commands to or from this SIM.
          # @param [command.Status] status Only return Commands with this status value.
          # @param [command.Direction] direction Only return Commands with this direction
          #   value.
          # @param [command.Transport] transport Only return Commands with this transport
          #   value.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(sim: :unset, status: :unset, direction: :unset, transport: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                sim: sim,
                status: status,
                direction: direction,
                transport: transport,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CommandInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of CommandInstance records from the API.
          # Request is executed immediately.
          # @param [String] sim Only return Commands to or from this SIM.
          # @param [command.Status] status Only return Commands with this status value.
          # @param [command.Direction] direction Only return Commands with this direction
          #   value.
          # @param [command.Transport] transport Only return Commands with this transport
          #   value.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CommandInstance
          def page(sim: :unset, status: :unset, direction: :unset, transport: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Sim' => sim,
                'Status' => status,
                'Direction' => direction,
                'Transport' => transport,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            CommandPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CommandInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CommandInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CommandPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CommandInstance records from the API.
          # Request is executed immediately.
          # @param [String] command The message body of the Command (in text mode) or a
          #   Base64 encoded byte string in binary mode.
          # @param [String] sim The Sid or UniqueName of the
          #   [SIM](https://www.twilio.com/docs/api/wireless/rest-api/sim) to send the Command
          #   to.
          # @param [String] callback_method The HTTP method Twilio will use when making a
          #   request to the callback URL (valid options are GET or POST). Defaults to POST.
          # @param [String] callback_url Twilio will make a request to this URL when the
          #   Command has finished sending (delivered or failed).
          # @param [command.CommandMode] command_mode A string representing which mode to
          #   send the SMS message using. May be `text` or `binary`. If omitted, the default
          #   SMS mode is `text`.
          # @param [String] include_sid When sending a Command to a SIM in text mode, Twilio
          #   can automatically include the Sid of the Command in the message body, which
          #   could be used to ensure that the device does not process the same Command more
          #   than once. The options for inclusion are `none`, `start` and `end`. The default
          #   behavior is `none`. When using `start` or `end`, the CommandSid will be
          #   prepended or appended to the message body, with a space character separating the
          #   CommandSid and the message body. The length of the CommandSid contributes toward
          #   the 160 character limit, i.e. the SMS body must be 128 characters or less before
          #   the Command Sid is included.
          # @param [Boolean] delivery_receipt_requested A boolean representing whether to
          #   request delivery receipt from the recipient. For Commands that request delivery
          #   receipt, the Command state transitions to 'delivered' once the server has
          #   received a delivery receipt from the device. Defaults to true.
          # @return [CommandInstance] Newly created CommandInstance
          def create(command: nil, sim: :unset, callback_method: :unset, callback_url: :unset, command_mode: :unset, include_sid: :unset, delivery_receipt_requested: :unset)
            data = Twilio::Values.of({
                'Command' => command,
                'Sim' => sim,
                'CallbackMethod' => callback_method,
                'CallbackUrl' => callback_url,
                'CommandMode' => command_mode,
                'IncludeSid' => include_sid,
                'DeliveryReceiptRequested' => delivery_receipt_requested,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CommandInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Wireless.V1.CommandList>'
          end
        end

        class CommandPage < Page
          ##
          # Initialize the CommandPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CommandPage] CommandPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CommandInstance
          # @param [Hash] payload Payload response from the API
          # @return [CommandInstance] CommandInstance
          def get_instance(payload)
            CommandInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Wireless.V1.CommandPage>'
          end
        end

        class CommandContext < InstanceContext
          ##
          # Initialize the CommandContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A 34 character string that uniquely identifies this
          #   resource.
          # @return [CommandContext] CommandContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Commands/#{@solution[:sid]}"
          end

          ##
          # Fetch a CommandInstance
          # @return [CommandInstance] Fetched CommandInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CommandInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CommandInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Wireless.V1.CommandContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Wireless.V1.CommandContext #{context}>"
          end
        end

        class CommandInstance < InstanceResource
          ##
          # Initialize the CommandInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A 34 character string that uniquely identifies this
          #   resource.
          # @return [CommandInstance] CommandInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'sim_sid' => payload['sim_sid'],
                'command' => payload['command'],
                'command_mode' => payload['command_mode'],
                'transport' => payload['transport'],
                'delivery_receipt_requested' => payload['delivery_receipt_requested'],
                'status' => payload['status'],
                'direction' => payload['direction'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CommandContext] CommandContext for this CommandInstance
          def context
            unless @instance_context
              @instance_context = CommandContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A 34 character string that uniquely identifies this resource.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The unique id of the Account that this Command belongs to.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique ID of the SIM that this Command was sent to or from.
          def sim_sid
            @properties['sim_sid']
          end

          ##
          # @return [String] The message being sent to or from the SIM.
          def command
            @properties['command']
          end

          ##
          # @return [command.CommandMode] A string representing which mode the SMS was sent or received using.
          def command_mode
            @properties['command_mode']
          end

          ##
          # @return [command.Transport] The transport
          def transport
            @properties['transport']
          end

          ##
          # @return [Boolean] The delivery_receipt_requested
          def delivery_receipt_requested
            @properties['delivery_receipt_requested']
          end

          ##
          # @return [command.Status] A string representing the status of the Command.
          def status
            @properties['status']
          end

          ##
          # @return [command.Direction] The direction of the Command.
          def direction
            @properties['direction']
          end

          ##
          # @return [Time] The date that this resource was created, given as GMT in ISO 8601 format.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date that this resource was last updated, given as GMT in ISO 8601 format.
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The URL for this resource.
          def url
            @properties['url']
          end

          ##
          # Fetch a CommandInstance
          # @return [CommandInstance] Fetched CommandInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the CommandInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Wireless.V1.CommandInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Wireless.V1.CommandInstance #{values}>"
          end
        end
      end
    end
  end
end