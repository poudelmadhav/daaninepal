class DonorformsController < ApplicationController
  before_action :set_donorform, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /donorforms
  # GET /donorforms.json
  def index
    @donorforms = Donorform.all
  end

  # GET /donorforms/1
  # GET /donorforms/1.json
  def show
  end

  # GET /donorforms/new
  def new
    @donorform = Donorform.new
  end

  # GET /donorforms/1/edit
  # def edit
  # end

  # POST /donorforms
  # POST /donorforms.json

  def create
    @donorform = Donorform.new(donorform_params)
    @donorform.user = current_user

    respond_to do |format|
      if @donorform.save
        WelcomeMailer.welcome_email(current_user).deliver
        format.html { redirect_to @donorform, notice: 'Donation was successfully requested.' }
        format.json { render :show, status: :created, location: @donorform }
      else
        format.html { render :new }
        format.json { render json: @donorform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donorforms/1
  # PATCH/PUT /donorforms/1.json
  def update
    if current_user.admin? 
      respond_to do |format|
        if @donorform.update(donorform_params)
          format.html { redirect_to @donorform, notice: 'Donorform was successfully updated.' }
          format.json { render :show, status: :ok, location: @donorform }
        else
          format.html { render :edit }
          format.json { render json: @donorform.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /donorforms/1
  # DELETE /donorforms/1.json
  def destroy
    if current_user.admin?
      @donorform.destroy

      respond_to do |format|
        format.html { redirect_to donorforms_url, notice: 'Donorform was successfully destroyed.' }
        format.json { head :no_content }
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donorform
      @donorform = Donorform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donorform_params
      params.require(:donorform).permit(:user_id, :title, :description, :amount, :promises, :approve, :reject, :deadline)
    end
end
