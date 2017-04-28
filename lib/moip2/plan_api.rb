module Moip2
  class PlanApi

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def create(plan)
      Resource::Plan.new client.post("/assinaturas/v1/plans", plan)
    end

    def update(plan)
      Resource::Plan.new client.put("/assinaturas/v1/plans/#{plan[:code]}", plan)
    end

    def details(code)
      Resource::Plan.new client.get("/assinaturas/v1/plans/#{code}")
    end
  end
end
