module Moip2
  class PlanApi
    attr_reader :client

    API_VERSION=1.freeze

    def initialize(client)
      @client = client
    end


    def base_path
      "/assinaturas/v1/plans"
    end

    def create(plan)
      Resource::Plan.new client.post(base_path, plan, api_version: API_VERSION)
    end

    def update(plan)
      Resource::Plan.new client.put("#{base_path}/#{plan[:code]}", plan, api_version: API_VERSION)
    end

    def details(code)
      Resource::Plan.new client.get("#{base_path}/#{code}", api_version: API_VERSION)
    end

    def customer
      Moip2::Plan::CustomerApi.new(client)
    end
  end
end
