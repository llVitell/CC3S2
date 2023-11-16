class ApplicationError < StandardError
    attr_reader :code
  
    def initialize(message, code = nil)
      super(message)
      @code = code
    end
end
  
class ValidationError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 400)
    end
end
  
class NotFoundError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 404)
    end
end
  
class UnauthorizedError < ApplicationError
    def initialize(message, code = nil)
      super(message, code || 401)
    end
end