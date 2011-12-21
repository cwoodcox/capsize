require "capsize/version"

module Capsize
  extend ActiveSupport::Concern
  DOWNCASE_FIELDS = []
  TITLEIZE_FIELDS = []

  module ClassMethods
    def downcase(*args)
      set_callback :save, :before, :downcase!
      options = args.extract_options!
    
      args.each do |field|
        Capsize::DOWNCASE_FIELDS << field
      end
    end

    def titleize(*args)
      set_callback :save, :before, :titleize!
      options = args.extract_options!

      args.each do |field|
        Capsize::TITLEIZE_FIELDS << field
      end
    end
  end

  def downcase!
    DOWNCASE_FIELDS.each do |field|
      self.send("#{field}=", self.send(field).downcase)
    end
  end

  def titleize!
    TITLEIZE_FIELDS.each do |field|
      self.send("#{field}=", self.send(field).titleize)
    end
  end
end
