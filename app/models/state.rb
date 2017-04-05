class State < ActiveRecord::Base

  validate :check_answer, :on => :update

  def check_answer
    if (self.guess.strip != self.capital)
      #errors.add(self.guess, "is incorrect")
      # p errors
    else
      self.correct_answer = true
    end
  end

  def next
    State.where("id > ?", id).limit(1).first
  end

  def prev
    State.where("id < ?", id).last
  end

   
end
