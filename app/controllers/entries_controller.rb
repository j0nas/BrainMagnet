class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  layout 'admin_lte_2'

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.where('patient_id = ?', current_patient.id)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    Entry.find_or_create_by(date: params[:date])
  end

  def go_to_date
    #entry = current_patient.entries.find_by(date: params[:date])
    entry = Entry.find_by(date: params[:date])
    if(entry)
      redirect_to edit_entry_url entry
    else
      redirect_to new_entry_url date: params[:date]
    end
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @entry.date = params.permit(:date) #@entry.date
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @date = @entry.date

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    @date = @entry.date

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:date, :mood, :sleep, :patient_id)
    end


end
