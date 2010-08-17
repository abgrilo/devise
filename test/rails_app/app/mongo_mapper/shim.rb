module Shim
  extend ::ActiveSupport::Concern
  
  
  # overwrite equality (because some devise tests use this for asserting model equality) 
  def ==(other)
    other.is_a?(self.class) && _id == other._id
  end
end
