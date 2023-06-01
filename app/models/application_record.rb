class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  after_destroy :purge_attached_files

  scope :def_includes, -> {includes(:image_blob, :category, :user)}

  private

  def purge_attached_files
    self.class.reflect_on_all_attachments.each do |reflection|
      public_send(reflection.name).purge_later if reflection.macro.in?(%i[has_one_attached has_many_attached])
    end
  end
end
