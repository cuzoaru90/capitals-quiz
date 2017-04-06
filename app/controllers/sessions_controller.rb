class SessionsController < ApplicationController

  def new
    
  end
 
  def create

    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
 
  def destroy

    @states = State.all
    @states.update_all(guess: "", correct_answer: false)


    if current_user.saved_an_answer && !current_user.submitted_quiz
      current_user.update_attributes(submitted_quiz: true)
      destroy_session(current_user)
      flash[:notice] = "You logged out with submitting your saved answers, so your quiz results are treated
        as zero. You may not take it again when you log in."
      redirect_to root_path
    else
      destroy_session(current_user)
      flash[:notice] = "You've been signed out, come back when you're ready for the quiz!"
      redirect_to root_path
    end

  end

end
