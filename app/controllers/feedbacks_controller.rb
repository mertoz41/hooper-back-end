class FeedbacksController < ApplicationController

    def create
        feedback = Feedback.create(supervisor_id: params["supervisor"]["id"], supervisee_id: params["supervisee"]["id"], message: params["message"])
        render json: feedback
    end 

end
