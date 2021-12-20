class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_sum, :summary
  
    #only one serializer needed for BONUS QUESTION
    
    #include below if want to SHOW the details, however.. not needed to access data in summary.
  
    # has_many :memberships
    # has_many :gyms, through: :memberships
  
    #custom serializer methods
    def membership_sum
      self.object.memberships.sum(:charge)
    end
  
    #ADDITIONAL BONUS --- USES DATA FROM ALL OVER
    # def summary
    #   "#{self.object.memberships.first.gym.name} is the best.. they charge me $#{self.object.memberships.first.charge}..."
    # end
  
  
end
