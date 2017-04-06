class StatesController < ApplicationController

 before_action :require_sign_in
 before_action :authorize_user
 before_action :check_submission


  ## Controllers for each region/continent
  def africa
     @african_states = State.where({region: 'Africa'})
  end

  def asia
     @asian_states = State.where({region: 'Asia'})
  end

  def canada
     @canadian_states = State.where({region: 'Canada'})
  end

  def central_america
     @central_states = State.where({region: 'Central America'})
  end

  def europe
     @european_states = State.where({region: 'Europe'})
  end
  
  # Just a menu for Canada and U.S., nothing needs to be done
  def north_america

  end

  def oceania
     @oceanic_states = State.where({region: 'Oceania'})
  end

  def south_america
     @south_states = State.where({region: 'South America'})
  end

  def united_states
     @united_states = State.where({region: 'United States'})
  end
  ## End of regions

  def index

  end

  def show
    @state =  State.find(params[:id])
    @answered = @state.correct_answer
  end


  def create

    @state = State.find(params[:id])
 
    if @state.save
      redirect_to @state
    end

  end

  def edit
    @state = State.find(params[:id])
  end


  def update
    @state = State.find(params[:id])
    @state.update_attributes(state_params)

    current_user.update_attributes(saved_an_answer: true)

    if @state.save
       flash[:notice] = "Saved the answer."
       redirect_to [@state]
     else
       flash.now[:alert] = "Couldn't save your answer. Please try again."
       render :show
     end

  end

  def answered
    @states = State.all
    @correct_answers = State.where({correct_answer: true})
    @num_correct_answers = @correct_answers.length

    @user = current_user
    @user.update_attributes(submitted_quiz: true)

    @states.update_all(guess: "", correct_answer: false)

  end

  private
 
  def state_params
    params.require(:state).permit(:guess, :correct_answer)
  end


  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to take quiz"
      redirect_to new_session_path
    end
  end
   
  def authorize_user
    unless current_user.test_taker?
      flash[:alert] = "You must be signed up to take the quiz."
      redirect_to root_path
    end
  end

  def check_submission
    if current_user.submitted_quiz?
      flash[:alert] = "You already submitted the quiz. You may not retake it."
      redirect_to root_path
    end
  end



end ## End of controller