##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class WebhookList < ListResource
          ##
          # Initialize the WebhookList
          # @param [Version] version Version that contains the resource
          # @return [WebhookList] WebhookList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Conversations.V1.WebhookList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class WebhookPage < Page
          ##
          # Initialize the WebhookPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [WebhookPage] WebhookPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of WebhookInstance
          # @param [Hash] payload Payload response from the API
          # @return [WebhookInstance] WebhookInstance
          def get_instance(payload)
            WebhookInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Conversations.V1.WebhookPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class WebhookContext < InstanceContext
          ##
          # Initialize the WebhookContext
          # @param [Version] version Version that contains the resource
          # @return [WebhookContext] WebhookContext
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Conversations/Webhooks"
          end

          ##
          # Fetch a WebhookInstance
          # @return [WebhookInstance] Fetched WebhookInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            WebhookInstance.new(@version, payload, )
          end

          ##
          # Update the WebhookInstance
          # @param [String] method The HTTP method to be used when sending a webhook
          #   request.
          # @param [String] filters The list of webhook event triggers that are enabled for
          #   this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`,
          #   `onConversationUpdated`, `onConversationRemoved`, `onParticipantAdded`,
          #   `onParticipantUpdated`, `onParticipantRemoved`
          # @param [String] pre_webhook_url The absolute url the pre-event webhook request
          #   should be sent to.
          # @param [String] post_webhook_url The absolute url the post-event webhook request
          #   should be sent to.
          # @param [webhook.Target] target The routing target of the webhook. Can be
          #   ordinary or route internally to Flex
          # @return [WebhookInstance] Updated WebhookInstance
          def update(method: :unset, filters: :unset, pre_webhook_url: :unset, post_webhook_url: :unset, target: :unset)
            data = Twilio::Values.of({
                'Method' => method,
                'Filters' => Twilio.serialize_list(filters) { |e| e },
                'PreWebhookUrl' => pre_webhook_url,
                'PostWebhookUrl' => post_webhook_url,
                'Target' => target,
            })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            WebhookInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Conversations.V1.WebhookContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Conversations.V1.WebhookContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class WebhookInstance < InstanceResource
          ##
          # Initialize the WebhookInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [WebhookInstance] WebhookInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'method' => payload['method'],
                'filters' => payload['filters'],
                'pre_webhook_url' => payload['pre_webhook_url'],
                'post_webhook_url' => payload['post_webhook_url'],
                'target' => payload['target'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [WebhookContext] WebhookContext for this WebhookInstance
          def context
            unless @instance_context
              @instance_context = WebhookContext.new(@version, )
            end
            @instance_context
          end

          ##
          # @return [String] The unique id of the Account responsible for this conversation.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [webhook.Method] The HTTP method to be used when sending a webhook request.
          def method
            @properties['method']
          end

          ##
          # @return [String] The list of webhook event triggers that are enabled for this Service.
          def filters
            @properties['filters']
          end

          ##
          # @return [String] The absolute url the pre-event webhook request should be sent to.
          def pre_webhook_url
            @properties['pre_webhook_url']
          end

          ##
          # @return [String] The absolute url the post-event webhook request should be sent to.
          def post_webhook_url
            @properties['post_webhook_url']
          end

          ##
          # @return [webhook.Target] The routing target of the webhook.
          def target
            @properties['target']
          end

          ##
          # @return [String] An absolute URL for this webhook.
          def url
            @properties['url']
          end

          ##
          # Fetch a WebhookInstance
          # @return [WebhookInstance] Fetched WebhookInstance
          def fetch
            context.fetch
          end

          ##
          # Update the WebhookInstance
          # @param [String] method The HTTP method to be used when sending a webhook
          #   request.
          # @param [String] filters The list of webhook event triggers that are enabled for
          #   this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`,
          #   `onConversationUpdated`, `onConversationRemoved`, `onParticipantAdded`,
          #   `onParticipantUpdated`, `onParticipantRemoved`
          # @param [String] pre_webhook_url The absolute url the pre-event webhook request
          #   should be sent to.
          # @param [String] post_webhook_url The absolute url the post-event webhook request
          #   should be sent to.
          # @param [webhook.Target] target The routing target of the webhook. Can be
          #   ordinary or route internally to Flex
          # @return [WebhookInstance] Updated WebhookInstance
          def update(method: :unset, filters: :unset, pre_webhook_url: :unset, post_webhook_url: :unset, target: :unset)
            context.update(
                method: method,
                filters: filters,
                pre_webhook_url: pre_webhook_url,
                post_webhook_url: post_webhook_url,
                target: target,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Conversations.V1.WebhookInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Conversations.V1.WebhookInstance #{values}>"
          end
        end
      end
    end
  end
end