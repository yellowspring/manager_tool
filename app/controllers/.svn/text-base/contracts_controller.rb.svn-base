class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.json
  def index
    session[:current] = 'menu_contracts'

    if ! params[:cid].nil? && params[:cid].to_i > 0
      session[:cid] = params[:cid]
      session[:history] = params[:history]
      @contracts = Contract.where("deleted is null and client_id = #{params[:cid]}")
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

   def download
    @contract = Contract.find(params[:id])
    
    if params[:type].to_s.downcase == 'contract'
      if params[:version].nil?
        contract_record = @contract.contractfiles.last
      else
        contract_record = Contractfile.where(:contract_id => @contract.id, :version => params[:version]).last
      end
      send_data contract_record.file.read,  :disposition => "inline", :type => "application/pdf", :filename => "#{@contract.client.name}_contract_V#{contract_record.version}.pdf"
    end
    
    if params[:type].to_s.downcase == 'ca'
      if params[:version].nil?
        ca_record =  @contract.ca_files.last
      else
        ca_record = CaFile.where(:contract_id => @contract.id, :version => params[:version]).last
      end
      send_data ca_record.file.read,  :disposition => "inline", :type => "application/pdf", :filename => "#{@contract.client.name}_CA_V#{ca_record.version}.pdf"
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    session[:current] = 'menu_contracts'
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
    session[:current] = 'menu_contracts'
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
    session[:current] = 'menu_contracts'
    @contract = Contract.find(params[:id])
    @contract.contractfiles.build
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    if session[:user].nil? 
       redirect_to :controller => "login", :action => "new"
    else
      @contract.updated_by = session[:user]
    end
    

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
    if session[:user].nil? 
       redirect_to :controller => "login", :action => "new"
    else
      @contract.updated_by = session[:user]
    end

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
    #@contract.destroy
    if session[:user].nil? 
      redirect_to :controller => "login", :action => "new"
    else
      @contract.updated_by = session[:user]
      @contract.deleted = true
    end
    @contract.sows.each do |s|
      s.updated_by = session[:user]
      s.deleted = true
    end
    @contract.save

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
