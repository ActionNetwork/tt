##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskList < ListResource
            ##
            # Initialize the TaskList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The ID of the Workspace that holds this Task
            # @return [TaskList] TaskList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks"
            end

            ##
            # Lists TaskInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] priority Retrieve the list of all Tasks in the workspace with
            #   the specified priority.
            # @param [String] assignment_status Returns the list of all Tasks in the workspace
            #   with the specified AssignmentStatus. Allowed AssignmentStatus values are
            #   pending, reserved, assigned, canceled, and completed.
            # @param [String] workflow_sid Returns the list of Tasks that are being controlled
            #   by the Workflow with the specified Sid value.
            # @param [String] workflow_name Returns the list of Tasks that are being
            #   controlled by the Workflow with the specified FriendlyName value.
            # @param [String] task_queue_sid Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the Sid specified.
            # @param [String] task_queue_name Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the FriendlyName specified.
            # @param [String] evaluate_task_attributes Provide a task attributes expression,
            #   and this will return tasks which match the attributes.
            # @param [String] ordering Use this parameter to control the order of the Tasks
            #   returned. The value should be passed in `Attribute:Order` format, where
            #   Attribute can be either `Priority` or `DateCreated` and Order can be either
            #   `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered by Priority
            #   in descending order. To sort the Tasks by Priority and DateCreated pass
            #   `Priority:desc,DateCreated:asc`. By Default Tasks are returned sorted by
            #   DateCreated in ascending order.
            # @param [Boolean] has_addons The has_addons
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, limit: nil, page_size: nil)
              self.stream(
                  priority: priority,
                  assignment_status: assignment_status,
                  workflow_sid: workflow_sid,
                  workflow_name: workflow_name,
                  task_queue_sid: task_queue_sid,
                  task_queue_name: task_queue_name,
                  evaluate_task_attributes: evaluate_task_attributes,
                  ordering: ordering,
                  has_addons: has_addons,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams TaskInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] priority Retrieve the list of all Tasks in the workspace with
            #   the specified priority.
            # @param [String] assignment_status Returns the list of all Tasks in the workspace
            #   with the specified AssignmentStatus. Allowed AssignmentStatus values are
            #   pending, reserved, assigned, canceled, and completed.
            # @param [String] workflow_sid Returns the list of Tasks that are being controlled
            #   by the Workflow with the specified Sid value.
            # @param [String] workflow_name Returns the list of Tasks that are being
            #   controlled by the Workflow with the specified FriendlyName value.
            # @param [String] task_queue_sid Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the Sid specified.
            # @param [String] task_queue_name Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the FriendlyName specified.
            # @param [String] evaluate_task_attributes Provide a task attributes expression,
            #   and this will return tasks which match the attributes.
            # @param [String] ordering Use this parameter to control the order of the Tasks
            #   returned. The value should be passed in `Attribute:Order` format, where
            #   Attribute can be either `Priority` or `DateCreated` and Order can be either
            #   `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered by Priority
            #   in descending order. To sort the Tasks by Priority and DateCreated pass
            #   `Priority:desc,DateCreated:asc`. By Default Tasks are returned sorted by
            #   DateCreated in ascending order.
            # @param [Boolean] has_addons The has_addons
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  priority: priority,
                  assignment_status: assignment_status,
                  workflow_sid: workflow_sid,
                  workflow_name: workflow_name,
                  task_queue_sid: task_queue_sid,
                  task_queue_name: task_queue_name,
                  evaluate_task_attributes: evaluate_task_attributes,
                  ordering: ordering,
                  has_addons: has_addons,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields TaskInstance records from the API.
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
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] priority Retrieve the list of all Tasks in the workspace with
            #   the specified priority.
            # @param [String] assignment_status Returns the list of all Tasks in the workspace
            #   with the specified AssignmentStatus. Allowed AssignmentStatus values are
            #   pending, reserved, assigned, canceled, and completed.
            # @param [String] workflow_sid Returns the list of Tasks that are being controlled
            #   by the Workflow with the specified Sid value.
            # @param [String] workflow_name Returns the list of Tasks that are being
            #   controlled by the Workflow with the specified FriendlyName value.
            # @param [String] task_queue_sid Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the Sid specified.
            # @param [String] task_queue_name Returns the list of Tasks that are currently
            #   waiting in the TaskQueue identified by the FriendlyName specified.
            # @param [String] evaluate_task_attributes Provide a task attributes expression,
            #   and this will return tasks which match the attributes.
            # @param [String] ordering Use this parameter to control the order of the Tasks
            #   returned. The value should be passed in `Attribute:Order` format, where
            #   Attribute can be either `Priority` or `DateCreated` and Order can be either
            #   `asc` or `desc`. For example, `Priority:desc` returns Tasks ordered by Priority
            #   in descending order. To sort the Tasks by Priority and DateCreated pass
            #   `Priority:desc,DateCreated:asc`. By Default Tasks are returned sorted by
            #   DateCreated in ascending order.
            # @param [Boolean] has_addons The has_addons
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of TaskInstance
            def page(priority: :unset, assignment_status: :unset, workflow_sid: :unset, workflow_name: :unset, task_queue_sid: :unset, task_queue_name: :unset, evaluate_task_attributes: :unset, ordering: :unset, has_addons: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Priority' => priority,
                  'AssignmentStatus' => Twilio.serialize_list(assignment_status) { |e| e },
                  'WorkflowSid' => workflow_sid,
                  'WorkflowName' => workflow_name,
                  'TaskQueueSid' => task_queue_sid,
                  'TaskQueueName' => task_queue_name,
                  'EvaluateTaskAttributes' => evaluate_task_attributes,
                  'Ordering' => ordering,
                  'HasAddons' => has_addons,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              TaskPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of TaskInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              TaskPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] timeout The amount of time in seconds the task is allowed to
            #   live up to a maximum of 2 weeks. Defaults to 24 hours. On timeout,
            #   `task.canceled` event will fire with description "Task TTL Exceeded".
            # @param [String] priority Override priority for the Task. When supplied, the Task
            #   will take on the given priority unless it matches a Workflow Target with a
            #   Priority set. When not supplied, the Task will take on the priority of the
            #   matching Workflow Target.
            # @param [String] task_channel When MultiTasking is enabled specify the type of
            #   the task by passing either TaskChannel Unique Name or Task Channel Sid. Default
            #   value is "default"
            # @param [String] workflow_sid The WorkflowSid for the Workflow that you would
            #   like to handle routing for this Task. If there is only one Workflow defined for
            #   the Workspace that you are posting a task to, then this is an optional
            #   parameter, and that single workflow will be used.
            # @param [String] attributes Url-encoded JSON string describing the attributes of
            #   this task. This data will be passed back to the Workflow's AssignmentCallbackURL
            #   when the Task is assigned to a Worker. An example task: `{ "task_type": "call",
            #   "twilio_call_sid": "CAxxx", "customer_ticket_number": "12345" }`
            # @return [TaskInstance] Newly created TaskInstance
            def create(timeout: :unset, priority: :unset, task_channel: :unset, workflow_sid: :unset, attributes: :unset)
              data = Twilio::Values.of({
                  'Timeout' => timeout,
                  'Priority' => priority,
                  'TaskChannel' => task_channel,
                  'WorkflowSid' => workflow_sid,
                  'Attributes' => attributes,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              TaskInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.TaskList>'
            end
          end

          class TaskPage < Page
            ##
            # Initialize the TaskPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [TaskPage] TaskPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of TaskInstance
            # @param [Hash] payload Payload response from the API
            # @return [TaskInstance] TaskInstance
            def get_instance(payload)
              TaskInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.TaskPage>'
            end
          end

          class TaskContext < InstanceContext
            ##
            # Initialize the TaskContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskContext] TaskContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:sid]}"

              # Dependents
              @reservations = nil
            end

            ##
            # Fetch a TaskInstance
            # @return [TaskInstance] Fetched TaskInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              TaskInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid], )
            end

            ##
            # Update the TaskInstance
            # @param [String] attributes The user-defined JSON data describing the custom
            #   attributes of this task.
            # @param [task.Status] assignment_status A 'pending' or 'reserved' Task may be
            #   canceled by posting AssignmentStatus='canceled'. Post
            #   AssignmentStatus='wrapping' to move Task to 'wrapup' state and
            #   AssignmentStatus='completed' to move a Task to 'completed' state.
            # @param [String] reason This is only required if the Task is canceled or
            #   completed. This logs the reason the task was either canceled or completed and
            #   queues the task for deletion after 5 minutes.
            # @param [String] priority Override priority for the Task. When supplied, the Task
            #   will take on the given priority unless it matches a Workflow Target with a
            #   Priority set.
            # @param [String] task_channel The task_channel
            # @return [TaskInstance] Updated TaskInstance
            def update(attributes: :unset, assignment_status: :unset, reason: :unset, priority: :unset, task_channel: :unset)
              data = Twilio::Values.of({
                  'Attributes' => attributes,
                  'AssignmentStatus' => assignment_status,
                  'Reason' => reason,
                  'Priority' => priority,
                  'TaskChannel' => task_channel,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              TaskInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid], )
            end

            ##
            # Deletes the TaskInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the reservations
            # @return [ReservationList]
            # @return [ReservationContext] if sid was passed.
            def reservations(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ReservationContext.new(@version, @solution[:workspace_sid], @solution[:sid], sid, )
              end

              unless @reservations
                @reservations = ReservationList.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                    task_sid: @solution[:sid],
                )
              end

              @reservations
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
            end
          end

          class TaskInstance < InstanceResource
            ##
            # Initialize the TaskInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The ID of the Workspace that holds this Task
            # @param [String] sid The sid
            # @return [TaskInstance] TaskInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'age' => payload['age'].to_i,
                  'assignment_status' => payload['assignment_status'],
                  'attributes' => payload['attributes'],
                  'addons' => payload['addons'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'priority' => payload['priority'].to_i,
                  'reason' => payload['reason'],
                  'sid' => payload['sid'],
                  'task_queue_sid' => payload['task_queue_sid'],
                  'task_queue_friendly_name' => payload['task_queue_friendly_name'],
                  'task_channel_sid' => payload['task_channel_sid'],
                  'task_channel_unique_name' => payload['task_channel_unique_name'],
                  'timeout' => payload['timeout'].to_i,
                  'workflow_sid' => payload['workflow_sid'],
                  'workflow_friendly_name' => payload['workflow_friendly_name'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [TaskContext] TaskContext for this TaskInstance
            def context
              unless @instance_context
                @instance_context = TaskContext.new(@version, @params['workspace_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The ID of the account that owns this Task
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The number of seconds since this task was created.
            def age
              @properties['age']
            end

            ##
            # @return [task.Status] Returns the list of all Tasks in the workspace with the specified AssignmentStatus.
            def assignment_status
              @properties['assignment_status']
            end

            ##
            # @return [String] The user-defined JSON string describing the custom attributes of this work.
            def attributes
              @properties['attributes']
            end

            ##
            # @return [String] The addon data for all installed addons is returned with this attribute
            def addons
              @properties['addons']
            end

            ##
            # @return [Time] Date this task was created, given as ISO 8601 format.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] Date this task was updated, given as ISO 8601 format.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] Retrieve the list of all Tasks in the workspace with the specified priority.
            def priority
              @properties['priority']
            end

            ##
            # @return [String] The reason the task was canceled  or completed
            def reason
              @properties['reason']
            end

            ##
            # @return [String] The unique ID of the Task
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Returns the list of Tasks that are currently waiting in the TaskQueue identified by the Sid specified.
            def task_queue_sid
              @properties['task_queue_sid']
            end

            ##
            # @return [String] The task_queue_friendly_name
            def task_queue_friendly_name
              @properties['task_queue_friendly_name']
            end

            ##
            # @return [String] The ID of the Task Channel
            def task_channel_sid
              @properties['task_channel_sid']
            end

            ##
            # @return [String] The unique name of the Task Channel
            def task_channel_unique_name
              @properties['task_channel_unique_name']
            end

            ##
            # @return [String] The amount of time in seconds the task is allowed to live
            def timeout
              @properties['timeout']
            end

            ##
            # @return [String] Returns the list of Tasks that are being controlled by the Workflow with the specified Sid value.
            def workflow_sid
              @properties['workflow_sid']
            end

            ##
            # @return [String] The workflow_friendly_name
            def workflow_friendly_name
              @properties['workflow_friendly_name']
            end

            ##
            # @return [String] The ID of the Workspace that holds this Task
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # Fetch a TaskInstance
            # @return [TaskInstance] Fetched TaskInstance
            def fetch
              context.fetch
            end

            ##
            # Update the TaskInstance
            # @param [String] attributes The user-defined JSON data describing the custom
            #   attributes of this task.
            # @param [task.Status] assignment_status A 'pending' or 'reserved' Task may be
            #   canceled by posting AssignmentStatus='canceled'. Post
            #   AssignmentStatus='wrapping' to move Task to 'wrapup' state and
            #   AssignmentStatus='completed' to move a Task to 'completed' state.
            # @param [String] reason This is only required if the Task is canceled or
            #   completed. This logs the reason the task was either canceled or completed and
            #   queues the task for deletion after 5 minutes.
            # @param [String] priority Override priority for the Task. When supplied, the Task
            #   will take on the given priority unless it matches a Workflow Target with a
            #   Priority set.
            # @param [String] task_channel The task_channel
            # @return [TaskInstance] Updated TaskInstance
            def update(attributes: :unset, assignment_status: :unset, reason: :unset, priority: :unset, task_channel: :unset)
              context.update(
                  attributes: attributes,
                  assignment_status: assignment_status,
                  reason: reason,
                  priority: priority,
                  task_channel: task_channel,
              )
            end

            ##
            # Deletes the TaskInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the reservations
            # @return [reservations] reservations
            def reservations
              context.reservations
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskInstance #{values}>"
            end
          end
        end
      end
    end
  end
end