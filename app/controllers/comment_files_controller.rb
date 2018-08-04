class CommentFilesController < ApplicationController
  before_action :set_comment_file, only: [:show, :edit, :update, :destroy]

  # GET /comment_files
  # GET /comment_files.json
  def index
    @comment_files = CommentFile.all
  end

  # GET /comment_files/1
  # GET /comment_files/1.json
  def show
  end

  # GET /comment_files/new
  def new
    @comment_file = CommentFile.new
  end

  # GET /comment_files/1/edit
  def edit
  end

  # POST /comment_files
  # POST /comment_files.json
  def create
    @comment_file = CommentFile.new(comment_file_params)

    respond_to do |format|
      if @comment_file.save
        format.html { redirect_back(fallback_location: users_path) }
        format.json { render :show, status: :created, location: @comment_file }
      else
        format.html { render :new }
        format.json { render json: @comment_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_files/1
  # PATCH/PUT /comment_files/1.json
  def update
    respond_to do |format|
      if @comment_file.update(comment_file_params)
        format.html { redirect_to @comment_file, notice: 'Comment file was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_file }
      else
        format.html { render :edit }
        format.json { render json: @comment_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_files/1
  # DELETE /comment_files/1.json
  def destroy
    @comment_file.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: users_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_file
      @comment_file = CommentFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_file_params
      params.require(:comment_file).permit(:id,:user_id, :file)
    end
end
