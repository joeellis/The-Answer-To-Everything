class Question < ActiveRecord::Base
  validates_presence_of :list
  validate :forty_second_element_error
  
  def before_save
    self.answer = self.list.split(",").forty_two
  end
  
  def forty_second_element_error
    if list.blank? || list.split(",").blank?
      errors.add(:answer, "Your list does not have a 42nd element.  You do not hold any part of the answer to the universe.  Sorry.") 
    end
  end

end
