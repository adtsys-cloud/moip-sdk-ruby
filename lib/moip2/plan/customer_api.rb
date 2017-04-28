module Moip2
  class Plan
    class CustomerApi
      attr_reader :client

      API_VERSION=1.freeze

      def initialize(client)
        @client = client
      end

      def base_path
        '/assinaturas/v1/customers'
      end

      def list
        Resource::Plan::Customer.new client, client.get("#{base_path}", api_version: API_VERSION)
      end

      def details(code)
        Resource::Plan::Customer.new client, client.get("#{base_path}/#{code}", api_version: API_VERSION)
      end

      def create(customer)
        Resource::Plan::Customer.new client, client.post(base_path, customer, api_version: API_VERSION)
      end

      def update(customer)
        Resource::Plan::Customer.new client, client.put("#{base_path}/#{customer[:code]}", customer, api_version: API_VERSION)
      end
    end
  end
end
