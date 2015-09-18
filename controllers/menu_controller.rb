require_relative "../models/address_book.rb"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu

    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View entry number n"
    puts "6 - Demolish all entries"
    puts "7 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "clear"
        view_number
        main_menu
      when 6
        system "clear"
        demolish_entries
        main_menu
      when 7
        puts "Good-bye!"

        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
      end
    end


    def view_all_entries
    # Iterate through all entries in AddressBook using each
      @address_book.entries.each do |entry|
        system "clear"
        puts entry.to_s
      # Call entry_submenu to display a submenu for each entry
        entry_submenu(entry)
      end
      system "clear"
      puts "End of entries"
    end

    def create_entry
      puts "New AddressBloc Entry"

      print "Name: "
      name = gets.chomp
      print "Phone number: "
      phone = gets.chomp
      print "Email: "
      email = gets.chomp
      @address_book.add_entry(name, phone, email)
      system "clear"
      puts "New entry created"
    end

    def search_entries
      print "Search by name: "
      name = gets.chomp
      match = @address_book.binary_search(name)
      if match
        puts match.to_s
        puts "Wow!! you found match for #{name}"
      else
        puts "No match found for #{name}"
      end
    end

    def read_csv
      print "Enter CSV file to import: "
      file_name = gets.chomp

      if file_name.empty?
        system "clear"
        puts "No CSV file read"
        main_menu
      end
      begin
        entry_count = @address_book.import_from_csv(file_name).count
        system "clear"
        puts "#{entry_count} new entries added from #{file_name}"
      rescue
        puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
        read_csv
      end
    end

    def delete_entry(entry)
      @address_book.entries.delete(entry)
      puts "#{entry.name} has been deleted"
    end
    def demolish_entries
      @address_book.demolish_entries
      puts "All entries are demolished"
      system "clear"
      main_menu
    end
    def edit_entry(entry)
      print "Updated name: "
      name = gets.chomp
      print "Updated phone number: "
      phone_number = gets.chomp
      print "Updated email: "
      email = gets.chomp
     #check empty parameters
      entry.name = name if !name.empty?
      entry.phone_number = phone_number if !phone_number.empty?
      entry.email = email if !email.empty?
      system "clear"
# update entry
      puts "Updated entry:"
      puts entry
    end

    def view_number
      system "clear"
      puts "Select entry number"
      num = gets.chomp.to_i
      num -= 1
      if num < @address_book.entries.count
        puts @address_book.entries[num]
        gets.chomp
      else
        puts "#{num} is not valid "
        main_menu
      end
    end

    def entry_submenu(entry)
      puts "n - next entry"
      puts "d - delete entry"
      puts "e - edit this entry"
      puts "m - return to main menu"
      selection = gets.chomp

     case selection
     when "n"
       next_entry(entry)
     when "d"
       delete_entry(entry)
     when "e"
       edit_entry(entry)
       entry_submenu(entry)
     when "m"
       system "clear"
       main_menu
     else
       system "clear"
       puts "#{selection} is not a valid input"
       main_menu
     end
   end
 end
