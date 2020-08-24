class PostingsController < ApplicationController
    # skip_before_action :authorized

    def index
        postings = Posting.all
        render json: postings
        
    end 

    def create
        posting = Posting.create(posting_params)
        render json: { posting: PostingSerializer.new(posting)}
    end 



    private 

    def posting_params
        params.require(:posting).permit(:user_id, :message, :location_id)
    end 
end
