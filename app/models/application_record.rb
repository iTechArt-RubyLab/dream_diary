class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  after_destroy :purge_attached_files

  private

  def purge_attached_files
    self.class.reflect_on_all_attachments.each do |reflection|
      if reflection.macro.in?([:has_one_attached, :has_many_attached])
        public_send(reflection.name).purge_later
      end
    end
  end
end
