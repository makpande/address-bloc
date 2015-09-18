require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

	let(:book)  { AddressBook.new }

	def check_entry(entry, expected_name, expected_number, expected_email)
		expect(entry.name).to eql expected_name
		expect(entry.phone_number).to eql expected_number
		expect(entry.email).to eql expected_email
	end

	context "attributes" do
		it "should respond to entries" do
			expect(book).to respond_to(:entries)
		end


		it "should initialize entries as an array" do
			expect(book.entries).to be_a(Array)
		end

		it "should initialize entries as empty" do
			expect(book.entries.size).to eq 0
		end
	end

#Adding entries to address book

	context "#add_entry" do
		it "adds only one entry to the address book" do
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

			expect(book.entries.size).to eq 1
		end

		it "adds the correct information to entries" do
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			new_entry = book.entries[0]

			expect(new_entry.name).to eq 'Ada Lovelace'
			expect(new_entry.phone_number).to eq '010.012.1815'
			expect(new_entry.email).to eq 'augusta.king@lovelace.com'
		end
	end

# checking Remove entries

	context "remove_entry" do
		it "deletes one entry of the address book" do
			book = AddressBook.new
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			book.remove_entry('Ada Lovelace', '010.012.1815','augusta.king@lovelace.com')
			expect(book.entries.size).to eq(0)
		end
	end

	context "demolish_entries" do
		it "Deletes all the entries of address_book" do
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			book.demolish_entries
			expect(book.entries.size).to eq(0)
		end
	end
	context "import_from_csv" do

		before do
			book.import_from_csv("entries_2.csv")
		end
		it "imports the correct number of entries" do


			book_size = book.entries.size

			expect(book_size).to eql 3
		end

# Importing entries_2 text file

		it "imports the 1st entry" do
			# book.import_from_csv("entries.csv")
			entry_one = book.entries[0]
			check_entry(entry_one, "Arun", "718-123-4567", "arun@blocmail.com")
		end
		it "imports the 2nd entry" do

			entry_two = book.entries[1]
			check_entry(entry_two, "Philip", "718-123-8901", "philip@blocmail.com")
		end

		it "imports the 3rd entry" do
			# book.import_from_csv("entries.csv")

			entry_three = book.entries[2]
			check_entry(entry_three, "Zen", "718-123-3660", "zen@blocmail.com")
		end

		def check_entry(entry, expected_name, expected_number, expected_email)
			expect(entry.name).to eql expected_name
			expect(entry.phone_number).to eql expected_number
			expect(entry.email).to eql expected_email
		end
end

#Importing text file
	context "import_from_csv" do

		before do
			book.import_from_csv("entries.csv")
		end
		it "imports the correct number of entries" do


			book_size = book.entries.size

			expect(book_size).to eql 5
		end


		it "imports the 1st entry" do
			# book.import_from_csv("entries.csv")

			entry_one = book.entries[0]
			check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
		end
		it "imports the 2nd entry" do

			entry_two = book.entries[1]
			check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
		end

		it "imports the 3rd entry" do
			# book.import_from_csv("entries.csv")

			entry_three = book.entries[2]
			check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
		end

		it "imports the 4th entry" do
			# book.import_from_csv("entries.csv")

			entry_four = book.entries[3]
			check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
		end

		it "imports the 5th entry" do
			# book.import_from_csv("entries.csv")

			entry_five = book.entries[4]
			check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
		end

	end

	def check_entry(entry, expected_name, expected_number, expected_email)
		expect(entry.name).to eql expected_name
		expect(entry.phone_number).to eql expected_number
		expect(entry.email).to eql expected_email
	end

	# Search for iterative_search

	context "#iterative_search" do
		before do
			book.import_from_csv("entries.csv")
		end

		it "searches AddressBook for a non-existent entry" do
			entry = book.binary_search("Jack")
			expect(entry).to be_nil
		end

		it "searches AddressBook for Bill" do
			entry = book.iterative_search("Bill")
			expect(entry).to be_a Entry
		end
		it "searches AddressBook for Bob" do
			entry = book.iterative_search("Bob")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Joe" do
			entry = book.iterative_search("Joe")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Sally" do
			entry = book.iterative_search("Sally")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Sussie" do
			entry = book.iterative_search("Sussie")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Jack" do
       entry = book.binary_search("Jack")
       expect(entry).to be_nil
    end
	end

	# For binary_search
	context "#binary_search" do
		before do
			book.import_from_csv("entries.csv")
		end
		it "searches AddressBook for a non-existent entry" do
			entry = book.binary_search("Jack")
			expect(entry).to be_nil
		end

		it "searches AddressBook for Bill" do
			entry = book.binary_search("Bill")
			expect(entry).to be_a Entry
		end
		it "searches AddressBook for Bob" do
			entry = book.binary_search("Bob")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Joe" do
			entry = book.binary_search("Joe")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Sally" do
			entry = book.binary_search("Sally")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Sussie" do
			entry = book.binary_search("Sussie")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Jack" do
       entry = book.binary_search("Jack")
       expect(entry).to be_nil
    end
	end
end
