class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def register
    @user = User.create(user_params)
    session[:id] = @user.id
    redirect_to ask_path
  end

  def ask
    @questions = Question.all
    @response = Response.new
  end

  def save_response
    user = User.find(session[:id])
    no_questions = ('1'..'10').to_a
    no_questions.each{|i|
      if params[i].class == String
        user.responses.create(question_id: i.to_i, answer_id: params[i].to_i)
      else
        params[i].each{|x|
          user.responses.create(question_id: i.to_i, answer_id: x.to_i)
        }
      end
    }
    redirect_to show_score_path
  end

  def show_score
    @user = User.find(session[:id])

    ans1 = Answer.where(question_id: 1..5)
    @section1_total=0
    ans1.each{|x| @section1_total += x.score }
    @section1_total

    ans2 = Answer.where(question_id: 6..10)
    @section2_total=0
    ans2.each{|x| @section2_total += x.score }
    @section2_total

    @total = @section1_total + @section1_total

    @section1 = @user.responses.where(question_id: 1..5)
    @score1 = 0
    @section1.each{|x|
      ans = Answer.find(x.answer_id)
      @score1 += ans.score
    }

    @section2 = @user.responses.where(question_id: 6..10)
    @score2 = 0
    @section2.each{|x|
      ans = Answer.find(x.answer_id)
      @score2 += ans.score
    }

    @score = @score1 + @score2
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone, :company, :email)
    end

    def permit_form
      params.require(:response).permit(('1'..'10').to_a)
    end

end
