class SowDetailsController < ApplicationController
  # GET /sow_details
  # GET /sow_details.json
  def index
    @sow_details = SowDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sow_details }
    end
  end

  # GET /sow_details/1
  # GET /sow_details/1.json
  def show
    @sow_detail = SowDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sow_detail }
    end
  end

  # GET /sow_details/new
  # GET /sow_details/new.json
  def new
    @sow_detail = SowDetail.new
    @sow = Sow.find(params[:sow_id])
    @contract = @sow.contract
    @sow_detail_template = SowDetailTemplate.find(:first, :conditions => ["sow_id =?", @sow.id] )

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sow_detail }
    end
  end

  # GET /sow_details/1/edit
  def edit
    @sow_detail = SowDetail.find(params[:id])
  end

  # POST /sow_details
  # POST /sow_details.json
  def create
    @sow_detail = SowDetail.new(params[:sow_detail])
    @sow_detail.sow = Sow.find(params[:sow_id])
    @sow_detail.version = @sow_detail.sow.sow_details.size + 1

    respond_to do |format|
      if @sow_detail.save
        format.html { redirect_to contract_sows_path(@sow_detail.sow.contract), notice: 'Sow detail was successfully created.' }
        format.json { render json: @sow_detail, status: :created, location: @sow_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @sow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sow_details/1
  # PUT /sow_details/1.json
  def update
    @sow_detail = SowDetail.find(params[:id])

    respond_to do |format|
      if @sow_detail.update_attributes(params[:sow_detail])
        format.html { redirect_to @sow_detail, notice: 'Sow detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sow_details/1
  # DELETE /sow_details/1.json
  def destroy
    @sow_detail = SowDetail.find(params[:id])
    @sow_detail.destroy

    respond_to do |format|
      format.html { redirect_to sow_details_url }
      format.json { head :ok }
    end
  end
end
