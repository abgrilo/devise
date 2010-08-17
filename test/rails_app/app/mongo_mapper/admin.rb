class Admin
  include MongoMapper::Document

  devise :database_authenticatable, :timeoutable, :registerable, :recoverable
  
  def self.find_for_authentication(conditions)
    last(:conditions => conditions, :order => "email")
  end
  
  
  # overwrite equality (because some devise tests use this for asserting model equality) 
  def ==(other)
    other.is_a?(self.class) && _id == other._id
  end
end
