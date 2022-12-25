class BookManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book_management, only: %i[ show edit update destroy ]

  # GET /book_managements or /book_managements.json
  def index
    @book_managements = BookManagement.all
  end

  # GET /book_managements/1 or /book_managements/1.json
  def show
  end

  # GET /book_managements/new
  def new
    @book_management = BookManagement.new
  end

  # GET /book_managements/1/edit
  def edit
  end

  def publish
    book_management = BookManagement.find(params[:book_management_id])
    book_management.publish = 1 if book_management.publish.blank?
    book_management.save
    SubscriberMailer.with(book_management: book_management).subscriber_mailer.deliver_later
    respond_to do |format|
      # SubscriberJob.perform_later params.permit(:message)[:message]
      format.html { redirect_to book_managements_url, notice: "Your Book is published." }
    end
  end

  def download_pdf
    book_management = BookManagement.find(params[:book_management_id])
    file_name = book_management.pdf_attachment.to_s
    @filedir = "#{Rails.root}/public#{file_name}"
    send_file(
      @filedir,
      type: "application/pdf",
      disposition: 'pdf_attachment'
    )
  end

  # POST /book_managements or /book_managements.json
  def create
    @book_management = BookManagement.new(book_management_params)
    @book_management.book_image.attach(book_management_params[:book_image])
    @book_management.published_date = Time.now

    respond_to do |format|
      if @book_management.save
        format.html { redirect_to book_management_url(@book_management), notice: "Book management was successfully created." }
        format.json { render :show, status: :created, location: @book_management }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_managements/1 or /book_managements/1.json
  def update
    respond_to do |format|
      if @book_management.update(book_management_params)
        format.html { redirect_to book_management_url(@book_management), notice: "Book management was successfully updated." }
        format.json { render :show, status: :ok, location: @book_management }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_managements/1 or /book_managements/1.json
  def destroy
    @book_management.destroy

    respond_to do |format|
      format.html { redirect_to book_managements_url, notice: "Book management was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_management
      @book_management = BookManagement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_management_params
      params.require(:book_management).permit(:title, :description, :author_id, :category_id, :book_image, :pdf_attachment)
    end
end
