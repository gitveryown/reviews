class ReviewsController < ApplicationController

    def index 
        #show all reviews 
       @reviews = Review.all
    end


    def new
        #new review 
        @review = Review.new
    end


    def create
        #create new review with model ie: title,body, and score
        @review = Review.new(form_params)

        #save review 
        @review.save
        
        redirect_to root_path
    end


    def show
        #individual review page
        @review = Review.find(params[:id])
    end


    def destroy
        #find individual review
        @review = Review.find(params[:id])
        #destroy it
        @review.destroy
        #redirect to homepage
        redirect_to root_path

    end


    def edit
        #find individual review to edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(form_params)
        redirect_to review_path
    end

   
    def form_params
        params.require(:review).permit(:title , :body, :score)
    end


end
