module Types
  class SorbetEnum < ActiveModel::Type::Value
    def initialize(enum_class)
      @enum_class = enum_class
    end

    def serialize(value)
      if value.kind_of?(@enum_class)
        value.serialize
      else
        super
      end
    end

    def deserialize(value)
      case
      when @enum_class
        value
      when String
        @enum_class.deserialize(value) if value
      else
        nil
      end
    end

    def cast(value)
      deserialize(value)
    end
  end
end