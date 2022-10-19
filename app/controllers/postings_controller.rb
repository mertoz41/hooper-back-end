class PostingsController < ApplicationController
    # skip_before_action :authorized

    def index
        postings = Posting.all
        render json: postings
        
    end 

    def show
        location = Location.find(params[:id])
        @postings = location.postings
        render json: {postings: ActiveModel::Serializer::CollectionSerializer.new(@postings, each_serializer: PostingSerializer)}
    end

    def create
        posting = Posting.create(user_id: current_user.id, message: params[:message], location_id: params[:location_id])
        render json: { posting: PostingSerializer.new(posting)}
    end 



    private 

    def posting_params
        params.require(:posting).permit(:user_id, :message, :location_id)
    end 
end
