require 'charyf'

module Charyf
  module Utils
    module StorageProvider
      class Memory < Base

        strategy_name :memory

        def self.get_for(klass)
          name = klass.to_s

          return _instance_map[name] if _instance_map[name]

          _instance_map[name] = self.new(name)
        end

        def self._instance_map
          @_instance_map ||= Hash.new
        end

        def initialize(target)
          @target = target
          @storage = Hash.new
        end

        def get(key)
          @storage[key]
        end

        def store(key, value)
          old = @storage[key]
          @storage[key] = value

          old
        end

        def remove(key)
          @storage.delete(key)
        end

      end
    end
  end
end