class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.json
  def index
    if ! params[:cid].nil? && params[:cid].to_i > 0
      session[:cid] = params[:cid]
      session[:history] = params[:history]
      @contracts = Contract.where("client_id = #{params[:cid]}").order(:client_id)
    else
      session[:cid] = 0
      session[:history] = params[:history]
      @contracts = Contract.find(:all, :order => ' client_id, created_at DESC' )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
    @client = Client.find(@contract.client_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new
    @contract.contractfiles.build
    if params[:client_id]
      @client = Client.find(params[:client_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end


  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
    @contract.contractfiles.build
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])

    respond_to do |format|
      if @contract.save
        format.html { redirect_to new_contract_sow_path(@contract) , notice: 'Contract was successfully created.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to clients_path(:clientid => @contract.client_id), notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      if params[:permanent] == '1'
        format.html { redirect_to clients_path(:clientid => @contract.client_id) }
        format.json { head :ok }
      else
        format.html { redirect_to clients_path(:clientid => @contract.client_id) }
        format.json { head :ok }
      end
    end
  end
end
