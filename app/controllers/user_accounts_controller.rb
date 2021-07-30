class UserAccountsController < ApplicationController
  before_action :set_user_account, only: %i[ show edit update destroy ]

  def index
    @user_accounts = UserAccount.all
  end

  def show
  end

  def change_status
    @user_accounts = User_account.find(params[:id])
    if params[:status].present? && User_account::STATUSES.include?(params[:status].to_sym)
      @user_account.update(status: params[:status])
    end
    redirect_to @user_account, notice: "Status updated to #{@user_account.status}"
  end

  def new
    @user_account = UserAccount.new
    # raise @user_account.inspect
  end

  def edit
  end

  def create
    @user_account = UserAccount.new(user_account_params)
    @user_account.first_name = params['first_name']
    @user_account.last_name = params['last_name']
    @user_account.user_id = params['user_id']
    @user_account.address1 = params['address1']
    @user_account.address2 = params['address2']
    @user_account.phone_number = params['phone_number']
    # raise params.inspect
    respond_to do |format|
      if @user_account.save
        @education = Education.create(cource_name: params["Name_Of_board"], university_name: params['university_name'], passing_year: params['passing_year'], percentage: params['percentage'], user_account_id: @user_account.id)
        @experience = Experience.create(company_name: params['company_name'], start_date: params['start_date'], end_date: params['end_date'], designation: params['designation'], user_account_id: @user_account.id)
        @language_known = Language.create(name: params['name'], read: params['read'], write: params['write'], speak: params['speak'], user_account_id: @user_account.id)
        @technology = Technology.create(name: params['name'], beginer: params['beginer'], middeator: params['middeator'], experter:params['experter'], user_account_id: @user_account.id)
        @preference= Preference.create(location_type: params['location_type'], notice_period: params['notice_period'], expected_ctc: params['expected_ctc'], current_ctc: params['current_ctc'], department_type: params['department_type'], user_account_id: @user_account.id)
        @reference_contact = RefrencesContact.create(ref_name: params['refernce_name'], ref_contact_number: params['reference_contact_number'], ref_relation: params['reference_relation'], user_account_id: @user_account.id)
    # raise @education.inspect 
        format.html { redirect_to @user_account, notice: "User account was successfully created." }
        format.json { render :show, status: :created, location: @user_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_account.update(user_account_params)
        format.html { redirect_to @user_account, notice: "User account was successfully updated." }
        format.json { render :show, status: :ok, location: @user_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_account.destroy
    respond_to do |format|
      format.html { redirect_to user_accounts_url, notice: "User account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user_account
      @user_account = UserAccount.find(params[:id])
    end
    def user_account_params
      params.require(:user_account).permit(:first_name, :last_name, :designation, :address1, :address2, :phone_number, :city, :gender, :state, :relation_status, :date_of_birth, :zipcode, :user_id)
    end
end
