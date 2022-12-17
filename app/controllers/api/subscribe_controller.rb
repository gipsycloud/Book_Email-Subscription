class Api::SubscribeController < ApplicationController
    # respond_to :json

    def index
        subscribe = Subscriber.all
        render json: subscribe
    end
end
