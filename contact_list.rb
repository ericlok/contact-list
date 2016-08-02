require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def main_menu
    puts "Here is a list of commands:
      new - Create a contact
      list - List all contacts
      show - Show a contact
      search - Search contacts"
  end

  def list
    Contact.all.each do |contact|
      puts "#{contact.id}: #{contact.name} (#{contact.email})"
    end
  end

  def find_name(term)
    Contact.all.find_all do |contact|
      contact.name.include?(term)
    end
  end

  def run
    case ARGV[0]
    when "list"
      list
    when "new"
      p "what's your name?"
      name = STDIN.gets.chomp
      p "what's your email?"
      email = STDIN.gets.chomp
      Contact.create(name, email)
    when "show"
      p Contact.find(ARGV[1])

    when "search"
      results = find_name(ARGV[1])

      unless results.length > 0
        puts "No contacts found containing that term in its name"
      else
        info = results.map {|result| "#{result.id}: #{result.name} (#{result.email})"} 
        puts info
        puts '---------------'
        puts results.length.to_s + ' records found'
      end
    else
      main_menu
    end
  end

end

ContactList.new.run
