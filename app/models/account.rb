class Account < ActiveRecord::Base
  has_many :vouchers_debited , :class_name=>'Voucher' , :foreign_key => 'account_debited' 
  has_many :vouchers_credited ,:class_name=>"Voucher" , :foreign_key => 'account_credited' 
  validates :name , presence: true 
  validates :name , uniqueness: true , :case_sensitive => false

  #FIXME_AB: Good. But This will return false when I call obj.destroy. Lets do one more thing add error to the object :base. "We are not allowing destroy or delete for Account". Do the same thing for delete. since obj.delete will delete the object. delete don't fire callbacks to you would need to overwite delete method in he model
  before_destroy { return false }
  #FIXME_AB: Since this is needed for dropdown and not belongs to Account. Move it to constant.rb in initializers. And name it ACCOUNT_FILTER_OPTIONS or something similar
  TYPES = ["debit" ,"credit"]
end
