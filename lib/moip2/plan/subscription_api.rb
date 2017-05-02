module Moip2
  class Plan
    class SubscriptionApi
      attr_reader :client

      API_VERSION=1.freeze

      def initialize(client)
        @client = client
      end

      def base_path
        '/assinaturas/v1/subscriptions'
      end

      def list
        Resource::Plan::Subscription.new client, client.get("#{base_path}", api_version: API_VERSION)
      end

      def details(code)
        Resource::Plan::Subscription.new client, client.get("#{base_path}/#{code}", api_version: API_VERSION)
      end

      def create(subscription, new_customer=false)
        Resource::Plan::Subscription.new client, client.post("#{base_path}?new_customer=#{new_customer.to_s}", subscription, api_version: API_VERSION)
      end

      def update(subscription)
        Resource::Plan::Subscription.new client, client.put("#{base_path}/#{subscription[:code]}", subscription, api_version: API_VERSION)
      end

      def suspend(code)
        Resource::Plan::Subscription.new client, client.put("#{base_path}/#{code}/suspend", {}, api_version: API_VERSION)
      end

      def activate(code)
        Resource::Plan::Subscription.new client, client.put("#{base_path}/#{code}/activate", {}, api_version: API_VERSION)
      end

      def cancel(code)
        Resource::Plan::Subscription.new client, client.put("#{base_path}/#{code}/cancel", {}, api_version: API_VERSION)
      end
    end
  end
end
