class SowDetailTemplatesController < ApplicationController
  # GET /sow_detail_templates
  # GET /sow_detail_templates.json
  def index
    @sow_detail_templates = SowDetailTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sow_detail_templates }
    end
  end

  # GET /sow_detail_templates/1
  # GET /sow_detail_templates/1.json
  def show
    @sow_detail_template = SowDetailTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sow_detail_template }
    end
  end

  # GET /sow_detail_templates/new
  # GET /sow_detail_templates/new.json
  def new
    @sow_detail_template = SowDetailTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sow_detail_template }
    end
  end

  # GET /sow_detail_templates/1/edit
  def edit
    @sow_detail_template = SowDetailTemplate.find(params[:id])
  end

  # POST /sow_detail_templates
  # POST /sow_detail_templates.json
  def create
    @sow_detail_template = SowDetailTemplate.new(params[:sow_detail_template])

    respond_to do |format|
      if @sow_detail_template.save
        format.html { redirect_to @sow_detail_template, notice: 'Sow detail template was successfully created.' }
        format.json { render json: @sow_detail_template, status: :created, location: @sow_detail_template }
      else
        format.html { render action: "new" }
        format.json { render json: @sow_detail_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sow_detail_templates/1
  # PUT /sow_detail_templates/1.json
  def update
    @sow_detail_template = SowDetailTemplate.find(params[:id])

    respond_to do |format|
      if @sow_detail_template.update_attributes(params[:sow_detail_template])
        format.html { redirect_to @sow_detail_template, notice: 'Sow detail template was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sow_detail_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sow_detail_templates/1
  # DELETE /sow_detail_templates/1.json
  def destroy
    @sow_detail_template = SowDetailTemplate.find(params[:id])
    @sow_detail_template.destroy

    respond_to do |format|
      format.html { redirect_to sow_detail_templates_url }
      format.json { head :ok }
    end
  end
end
