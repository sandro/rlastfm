module Rlastfm
  module Helpers
    module RemoteAccessor
      def remote_reader(*accessors)
        accessors.each do |reader|
          case reader
          when Symbol
            add_reader reader
          when Hash
            add_mapped_reader reader
          else
            raise "remote_reader requires a Hash or Symbol"
          end
        end
      end

      def add_mapped_reader(mapping)
        remote_reader_name = mapping.delete(:from)
        reader_name        = mapping.delete(:to)
        raise "remote_accessor_mapping requires :from and :to arguments" unless remote_reader_name && reader_name

        add_reader reader_name, remote_reader_name
      end

      def add_reader(reader_name, remote_reader_name=nil)
        remote_reader_name ||= reader_name
        define_method reader_name do
          raw[remote_reader_name.to_s]
        end

        memoize_method reader_name
      end

      def memoize_method(method_name)
        i_var_name = :"@#{method_name}"
        method_without = :"#{method_name}_without_memoization"
        method_with = :"#{method_name}_with_memoization"

        class_eval do
          define_method method_with do
            instance_variable_get(i_var_name) || instance_variable_set(i_var_name, send(method_without))
          end
          alias_method method_without, method_name
          alias_method method_name, method_with
        end
      end
    end
  end
end

