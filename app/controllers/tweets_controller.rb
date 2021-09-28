class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]

  # GET /tweets or /tweets.json
  def base
    render ""
  end


  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @user = @tweet.user
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
  end
  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json

  def delete_post
    connection.execute("DELETE FROM tweets WHERE tweets.id = ?", params['id'])

    redirect_to '/'
  end


  def destroy
    @tweet = Tweet.find(params[:id])

    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:Title, :Content)
    end
end
