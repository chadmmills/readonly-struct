require "readonly_struct/version"

module ReadonlyStruct
  def self.new(hash={})
    ReadonlyStruct.new(hash)
  end

  class ReadonlyStruct
    def initialize(hash={})
      hash.each_pair do |key, value|
        add_readers(key, value)
      end
    end

    private

    def add_readers(key, value)
      key = key.to_sym
      instance_variable_set(:"@#{key}", value)
    end

    def method_missing(method_identifier, *args)
      if method_value = instance_variable_get(:"@#{method_identifier}")
        method_value
      else
        raise NoMethodError, "#{method_identifier} in not defined on this instance of ReadonlyStruct"
      end
    end
  end
end
