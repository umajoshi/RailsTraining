class StoriesController < ApplicationController
 # before_action :check_logged_in, except:[:index, :show]
  before_action :send_to_index,
  unless: :user_signed_in?,
  except: [:index, :show]

  before_action :set_story, only: [:edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

def lookup
  render json: {exists: CanonicalURLValidator.exists?(params[:url]) }
end
  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create

    @story = current_user.stories.build(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def send_to_index
      redirect_to stories_url, alert: "Please log in before you can #{action_name}"
    end
      
    def check_logged_in
      unless user_signed_in?
        redirect_to stories_url, alert: "Please log in to #{action_name}."
      end
    end

    def set_story
      @story = current_user.stories.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:url, :title, :author, :description, :published_on)
    end
end
