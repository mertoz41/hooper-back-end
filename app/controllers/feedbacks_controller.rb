class FeedbacksController < ApplicationController

    def create
        @feedback = Feedback.create(supervisor_id: current_user.id, supervisee_id: params["supervisee_id"], message: params["message"])
        render json: @feedback, serializer: FeedbackSerializer
    end 

end
