class Photo < ActiveRecord::Base
  belongs_to :photable, :polymorphic => true, :counter_cache => true
  has_attached_file :photo, :styles => { :thumb => "x110",
                                         :normal => "x330"
                                       }
  validates_attachment_presence :photo
end