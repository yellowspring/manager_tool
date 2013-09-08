class SowsController < ApplicationController
  # GET /sows
  # GET /sows.json
  def index
    @contract = Contract.find(params[:contract_id])
    @sows = Sow.find(:all, :conditions => [ "contract_id = ?", params[:contract_id]])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sows }
    end
  end

  # GET /sows/1
  # GET /sows/1.json
  def show
    @sow = Sow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sow }
    end
  end

  # GET /sows/new
  # GET /sows/new.json
  def new
    @sow = Sow.new
    @sow.sow_files.build
    @contract = Contract.find(params[:contract_id])
    @path = [@contract,@sow]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sow }
    end
  end

  # GET /sows/1/edit
  def edit
    @sow = Sow.find(params[:id])
    @contract = Contract.find(params[:contract_id])
    @path = @sow
  end

  # POST /sows
  # POST /sows.json
  def create
    @sow = Sow.new(params[:sow])
    @sow.contract = Contract.find(params[:contract_id])
    
    respond_to do |format|
      if @sow.save
        
          format.html { redirect_to new_contract_sow_path(@sow.contract), notice: 'Sow was successfully created.' }
          format.json { render json: @sow, status: :created, location: @sow }
      else
        @contract = Contract.find(params[:contract_id])
        @path = [@contract,@sow]
        format.html { render action: "new" }
        format.json { render json: @sow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sows/1
  # PUT /sows/1.json
  def update
  @sow = Sow.find(params[:id])

    respond_to do |format|
      if @sow.update_attributes(params[:sow])
        format.html { redirect_to  contract_sows_path(@sow.contract), notice: 'Sow was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sows/1
  # DELETE /sows/1.json
  def destroy
    @sow = Sow.find(params[:id])
    @contract = @sow.contract
    @sow.destroy

    respond_to do |format|
      format.html { redirect_to contract_sows_path(@contract) }
      format.json { head :ok }
    end
  end
end
