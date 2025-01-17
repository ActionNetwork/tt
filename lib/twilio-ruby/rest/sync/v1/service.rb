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
        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Services"
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Human-readable name for this service instance
          # @param [String] webhook_url A URL that will receive event updates when objects
          #   are manipulated.
          # @param [Boolean] reachability_webhooks_enabled `true` or `false` - controls
          #   whether this instance fires webhooks when client endpoints connect to Sync
          #   Defaults to false.
          # @param [Boolean] acl_enabled `true` or `false` - determines whether token
          #   identities must be granted access to Sync objects via the [Permissions
          #   API](https://www.twilio.com/docs/api/sync/rest/sync-rest-api-permissions) in
          #   this Service.
          # @param [Boolean] reachability_debouncing_enabled `true` or `false` - If false,
          #   every endpoint disconnection immediately yields a reachability webhook (if
          #   enabled). If true, then 'disconnection' webhook events will only be fired after
          #   a configurable delay. Intervening reconnections would effectively cancel that
          #   webhook. Defaults to false.
          # @param [String] reachability_debouncing_window Reachability webhook delay period
          #   in milliseconds. Determines the delay after which a Sync identity is declared
          #   actually offline, measured from the moment the last running client disconnects.
          #   If all endpoints remain offline throughout this delay, then reachability
          #   webhooks will be fired (if enabled). A reconnection by any endpoint during this
          #   window — from the same identity — means no reachability webhook would be fired.
          #   Must be between 1000 and 30000. Defaults to 5000.
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: :unset, webhook_url: :unset, reachability_webhooks_enabled: :unset, acl_enabled: :unset, reachability_debouncing_enabled: :unset, reachability_debouncing_window: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'WebhookUrl' => webhook_url,
                'ReachabilityWebhooksEnabled' => reachability_webhooks_enabled,
                'AclEnabled' => acl_enabled,
                'ReachabilityDebouncingEnabled' => reachability_debouncing_enabled,
                'ReachabilityDebouncingWindow' => reachability_debouncing_window,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ServiceInstance.new(@version, payload, )
          end

          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ServiceInstance records from the API.
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
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ServiceInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ServicePage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Sync.V1.ServiceList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            ServiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Sync.V1.ServicePage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid A unique identifier for this service instance.
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Services/#{@solution[:sid]}"

            # Dependents
            @documents = nil
            @sync_lists = nil
            @sync_maps = nil
            @sync_streams = nil
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Update the ServiceInstance
          # @param [String] webhook_url A URL that will receive event updates when objects
          #   are manipulated.
          # @param [String] friendly_name Human-readable name for this service instance
          # @param [Boolean] reachability_webhooks_enabled True or false - controls whether
          #   this instance fires webhooks when client endpoints connect to Sync Defaults to
          #   false.
          # @param [Boolean] acl_enabled `true` or `false` - determines whether token
          #   identities must be granted access to Sync objects via the [Permissions
          #   API](https://www.twilio.com/docs/api/sync/rest/sync-rest-api-permissions) in
          #   this Service.
          # @param [Boolean] reachability_debouncing_enabled `true` or `false` - If false,
          #   every endpoint disconnection immediately yields a reachability webhook (if
          #   enabled). If true, then 'disconnection' webhook events will only be fired after
          #   a configurable delay. Intervening reconnections would effectively cancel that
          #   webhook. Defaults to false.
          # @param [String] reachability_debouncing_window Reachability webhook delay period
          #   in milliseconds. Determines the delay after which a Sync identity is declared
          #   actually offline, measured from the moment the last running client disconnects.
          #   If all endpoints remain offline throughout this delay, then reachability
          #   webhooks will be fired (if enabled). A reconnection by any endpoint during this
          #   window — from the same identity — means no reachability webhook would be fired.
          #   Must be between 1000 and 30000. Defaults to 5000.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(webhook_url: :unset, friendly_name: :unset, reachability_webhooks_enabled: :unset, acl_enabled: :unset, reachability_debouncing_enabled: :unset, reachability_debouncing_window: :unset)
            data = Twilio::Values.of({
                'WebhookUrl' => webhook_url,
                'FriendlyName' => friendly_name,
                'ReachabilityWebhooksEnabled' => reachability_webhooks_enabled,
                'AclEnabled' => acl_enabled,
                'ReachabilityDebouncingEnabled' => reachability_debouncing_enabled,
                'ReachabilityDebouncingWindow' => reachability_debouncing_window,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ServiceInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the documents
          # @return [DocumentList]
          # @return [DocumentContext] if sid was passed.
          def documents(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return DocumentContext.new(@version, @solution[:sid], sid, )
            end

            unless @documents
              @documents = DocumentList.new(@version, service_sid: @solution[:sid], )
            end

            @documents
          end

          ##
          # Access the sync_lists
          # @return [SyncListList]
          # @return [SyncListContext] if sid was passed.
          def sync_lists(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return SyncListContext.new(@version, @solution[:sid], sid, )
            end

            unless @sync_lists
              @sync_lists = SyncListList.new(@version, service_sid: @solution[:sid], )
            end

            @sync_lists
          end

          ##
          # Access the sync_maps
          # @return [SyncMapList]
          # @return [SyncMapContext] if sid was passed.
          def sync_maps(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return SyncMapContext.new(@version, @solution[:sid], sid, )
            end

            unless @sync_maps
              @sync_maps = SyncMapList.new(@version, service_sid: @solution[:sid], )
            end

            @sync_maps
          end

          ##
          # Access the sync_streams
          # @return [SyncStreamList]
          # @return [SyncStreamContext] if sid was passed.
          def sync_streams(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return SyncStreamContext.new(@version, @solution[:sid], sid, )
            end

            unless @sync_streams
              @sync_streams = SyncStreamList.new(@version, service_sid: @solution[:sid], )
            end

            @sync_streams
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Sync.V1.ServiceContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Sync.V1.ServiceContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid A unique identifier for this service instance.
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'unique_name' => payload['unique_name'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'webhook_url' => payload['webhook_url'],
                'reachability_webhooks_enabled' => payload['reachability_webhooks_enabled'],
                'acl_enabled' => payload['acl_enabled'],
                'reachability_debouncing_enabled' => payload['reachability_debouncing_enabled'],
                'reachability_debouncing_window' => payload['reachability_debouncing_window'].to_i,
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] A unique identifier for this service instance.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The unique_name
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] Human-readable name for this service instance
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] A URL that will receive event updates when objects are manipulated.
          def webhook_url
            @properties['webhook_url']
          end

          ##
          # @return [Boolean] true or false - controls whether this instance fires webhooks when client endpoints connect to Sync
          def reachability_webhooks_enabled
            @properties['reachability_webhooks_enabled']
          end

          ##
          # @return [Boolean] true or false - determines whether token identities must be granted access to Sync objects via the Permissions API in this Service.
          def acl_enabled
            @properties['acl_enabled']
          end

          ##
          # @return [Boolean] true or false - Determines whether transient disconnections (i.e. an immediate reconnect succeeds) cause reachability webhooks.
          def reachability_debouncing_enabled
            @properties['reachability_debouncing_enabled']
          end

          ##
          # @return [String] Determines how long an identity must be offline before reachability webhooks fire.
          def reachability_debouncing_window
            @properties['reachability_debouncing_window']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Update the ServiceInstance
          # @param [String] webhook_url A URL that will receive event updates when objects
          #   are manipulated.
          # @param [String] friendly_name Human-readable name for this service instance
          # @param [Boolean] reachability_webhooks_enabled True or false - controls whether
          #   this instance fires webhooks when client endpoints connect to Sync Defaults to
          #   false.
          # @param [Boolean] acl_enabled `true` or `false` - determines whether token
          #   identities must be granted access to Sync objects via the [Permissions
          #   API](https://www.twilio.com/docs/api/sync/rest/sync-rest-api-permissions) in
          #   this Service.
          # @param [Boolean] reachability_debouncing_enabled `true` or `false` - If false,
          #   every endpoint disconnection immediately yields a reachability webhook (if
          #   enabled). If true, then 'disconnection' webhook events will only be fired after
          #   a configurable delay. Intervening reconnections would effectively cancel that
          #   webhook. Defaults to false.
          # @param [String] reachability_debouncing_window Reachability webhook delay period
          #   in milliseconds. Determines the delay after which a Sync identity is declared
          #   actually offline, measured from the moment the last running client disconnects.
          #   If all endpoints remain offline throughout this delay, then reachability
          #   webhooks will be fired (if enabled). A reconnection by any endpoint during this
          #   window — from the same identity — means no reachability webhook would be fired.
          #   Must be between 1000 and 30000. Defaults to 5000.
          # @return [ServiceInstance] Updated ServiceInstance
          def update(webhook_url: :unset, friendly_name: :unset, reachability_webhooks_enabled: :unset, acl_enabled: :unset, reachability_debouncing_enabled: :unset, reachability_debouncing_window: :unset)
            context.update(
                webhook_url: webhook_url,
                friendly_name: friendly_name,
                reachability_webhooks_enabled: reachability_webhooks_enabled,
                acl_enabled: acl_enabled,
                reachability_debouncing_enabled: reachability_debouncing_enabled,
                reachability_debouncing_window: reachability_debouncing_window,
            )
          end

          ##
          # Access the documents
          # @return [documents] documents
          def documents
            context.documents
          end

          ##
          # Access the sync_lists
          # @return [sync_lists] sync_lists
          def sync_lists
            context.sync_lists
          end

          ##
          # Access the sync_maps
          # @return [sync_maps] sync_maps
          def sync_maps
            context.sync_maps
          end

          ##
          # Access the sync_streams
          # @return [sync_streams] sync_streams
          def sync_streams
            context.sync_streams
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Sync.V1.ServiceInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Sync.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end