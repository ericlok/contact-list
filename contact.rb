require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  attr_accessor :name, :email, :id
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    # TODO: Assign parameter values to instance variables.
    @id = id
    @name = name
    @email = email
  end

  # Provides functionality for managing contacts in the csv file.
  class << self
    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      contact_array = []
      CSV.foreach("contacts.csv", skip_blanks: true) do |row|
        contact_array.push Contact.new(row[0],row[1],row[2])
      end
      contact_array
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      number_of_records = CSV.read("contacts.csv")
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      new_contact = [] 
      new_id = number_of_records.length+1
      CSV.open("contacts.csv", "ab") do |csv|
        csv<<[new_id, name, email]
      end
      new_contact
    end

    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      flag = false
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach("contacts.csv") do |row|
        if row[0].to_i == id.to_i
          return row
        else
          flag = true
        end
      end
      if flag
        return "Sorry record not found"
      end

    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # Contact.all.each /\w/
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end



  end

end

