class Profile < ApplicationRecord

	SALT = "\x9Flm\x12r}\xDF\x1D\xBB\xAFR\xF7\xD8\x92K\x85Q\x92\x10_7\xCC~\x88}vjq\x97\xF3\xF5p\xEF\xC5\xD9T\x10\xAB\x952\x1E/\xE2\x91\xEFaH\xC8\x03\x04t\x83v\xFD\xE0\x9E\x03\x8B\xF4e\xB9\xE7t6"
  KEY = "\x04G\xB2X\x9D'\xAD\x98\xA8\xA1\xEA\x7Fp\xCB\e\xFA~\x97\xA9V\xF1\xBBbV\xCF\xBD\xE5\x97\x17,}f"
  
  CRYPT = ActiveSupport::MessageEncryptor.new(KEY)

  validates :name , presence: true

  before_save :encrypted_data

  private
   def encrypted_data
     name_from_from = self.name
     contact_number = self.contact_number
     email_id = self.email_id
     current_city = self.current_city

     encrypted_name = CRYPT.encrypt_and_sign(name_from_from)
     encrypted_contact = CRYPT.encrypt_and_sign(contact_number)
     encrypted_email = CRYPT.encrypt_and_sign(email_id)
     encrypted_current_city = CRYPT.encrypt_and_sign(current_city)

     self.name = encrypted_name
     self.contact_number = encrypted_contact
     self.email_id = encrypted_email
     self.current_city = encrypted_current_city
  end

end
