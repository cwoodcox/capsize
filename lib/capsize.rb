require "capsize/version"

module Capsize
  extend ActiveSupport::Concern
  
  module ClassMethods
    def downcase(*args)
      options = args.extract_options!
      capsize!(:downcase, args, options)
    end

    def titleize(*args)
      options = args.extract_options!
      capsize!(:titleize, args, options)
    end

    private
    def capsize!(method, attrs, options={})
      attrs.each do |attribute|
        set_callback :save, :before, lambda { |record|
          record.send("#{attribute}=", record.send(attribute).send(method))
        }
      end
    end
  end
end
