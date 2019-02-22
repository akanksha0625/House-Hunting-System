class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    @@inquiry_id =params[:id]
    @replies  = Reply.where(inquiry_id: @@inquiry_id).order(created_at: :desc)
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
    @@inquiry_id =params[:id]

  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies.json
  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    @reply.inquiry_id=@@inquiry_id
    @inquiry = Inquiry.find(@@inquiry_id)
    @house = House.find(@inquiry.house_id)
    respond_to do |format|
      if @reply.save
        format.html { redirect_to house_path(@house), notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @reply }
        @house_hunter = User.find(params[@inquiry.user_id]).email
        NotifierMailer.response(@house_hunter)
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end

    end

  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:body, :inquiry_id)
    end
end
