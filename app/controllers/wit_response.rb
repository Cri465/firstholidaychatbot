class WitResponse

  def initialize(params)
    @response = params
  end

  def intents
    @response["intents"]
  end
end