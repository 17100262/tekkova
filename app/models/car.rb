class Car < ApplicationRecord
    has_and_belongs_to_many :car_features
    # has_many_attached :images
    serialize :availibility_days,Array
    belongs_to :user
    attr_accessor :step
    has_many :car_pictures, dependent: :destroy
    attr_accessor :licenseback_remove
    attr_accessor :licensefront_remove
    
    
    accepts_nested_attributes_for :car_pictures, reject_if: :all_blank, allow_destroy: true
    
    
    has_attached_file :licensefront, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :licensefront, content_type: /\Aimage\/.*\z/
  
    has_attached_file :licenseback, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :licenseback, content_type: /\Aimage\/.*\z/
    
    enum status: [:draft,:completed]
    
    attr_accessor :model_year_check
    attr_accessor :usage_limit_check
    attr_accessor :register_check
    attr_accessor :road_worthy_check
    attr_accessor :write_off_check
    attr_accessor :maintained_check
    
    validates :model_year_check, inclusion: { in: ["1"],message: "%{value} is not a valid size" },:if => Proc.new{|f| f.step == "0" }
    validates :usage_limit_check, inclusion: { in: ["1"]},:if => Proc.new{|f| f.step == "0" }
    validates :register_check, inclusion: { in: ["1"]},:if => Proc.new{|f| f.step == "0" }
    validates :road_worthy_check, inclusion: { in: ["1"]},:if => Proc.new{|f| f.step == "0" }
    validates :write_off_check, inclusion: { in: ["1"]},:if => Proc.new{|f| f.step == "0" }
    validates :maintained_check, inclusion: { in: ["1"]},:if => Proc.new{|f| f.step == "0" }
    
    
    validates :driving_liecense_number, length: { is: 7 },:if => Proc.new{|f| f.step == "5" }
    validates :personal_mobile, length: { is: 10 },:if => Proc.new{|f| f.step == "6" }, numericality: { only_integer: true }
    
    
    before_save :check_photo,:check_license_photo
    
    def check_photo
      car_pictures.each(&:delete_photo)
    end
    
    def check_license_photo
      if self.licensefront_remove == "1"
        licensefront.clear
      end
      if self.licenseback_remove == "1"
        licenseback.clear
      end
        
    end
    
    # private
    
    def car_form_partial
        case self.step
        when "0"
          'cars/car_form_steps/_listing_criteria'
        when "1"
          'cars/car_form_steps/_1_car_details'
        when "2"
          'cars/car_form_steps/_2_car_pictures'
        when "3"
          'cars/car_form_steps/_3_availibility_and_pickup'
        when "4"
          'cars/car_form_steps/_4_car_preference'
        when "5"
          'cars/car_form_steps/_5_driver_liecense'
        when "6"
          'cars/car_form_steps/_6_personal_details'
        else
           'cars/car_form_steps/_2_car_pictures.html.erb'
        end
    end





end
