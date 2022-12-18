class AddPdfAttachmentToBookManagement < ActiveRecord::Migration[6.0]
  def change
    add_column :book_managements, :pdf_attachment, :string
  end
end
