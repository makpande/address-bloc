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
	context ".import_from_csv" do

		before do
			book.import_from_csv("spec/entries.csv")
		end
		it "imports the correct number of entries" do


			book_size = book.entries.size

			expect(book_size).to eql 5
		end


		it "imports the 1st entry" do
			# book.import_from_csv("entries.csv")

			entry_one = book.entries[0]

			check_entry(entry_one, "Gary", "555-555-4854", "Gary@gmailmail.com")
		end
		it "imports the 2nd entry" do
			# book.import_from_csv("entries.csv")

			entry_two = book.entries[1]
			check_entry(entry_two, "Philip", "555-555-5415", "Philip@gmailmail.com")
		end

		it "imports the 3rd entry" do
			# book.import_from_csv("entries.csv")

			entry_three = book.entries[2]
			check_entry(entry_three, "Arun", "555-555-3660", "Arun@blocmail.com")
		end

		it "imports the 4th entry" do
			# book.import_from_csv("entries.csv")

			entry_four = book.entries[3]
			check_entry(entry_four, "Mike", "555-555-4646", "Mike@blocmail.com")
		end

		it "imports the 5th entry" do
			# book.import_from_csv("entries.csv")

			entry_five = book.entries[4]
			check_entry(entry_five, "Sharon", "555-555-2036", "Sharon@blocmail.com")
		end

	end
	def check_entry(entry, expected_name, expected_number, expected_email)
		expect(entry.name).to eql expected_name
		expect(entry.phone_number).to eql expected_number
		expect(entry.email).to eql expected_email
	end

	context "#binary_search" do
		before do
			book.import_from_csv("spec/entries.csv")
		end
		it "searches AddressBook for a non-existent entry" do
			entry = book.binary_search("Mack")
			expect(entry).to be_nil
		end

		it "searches AddressBook for Gary" do
			entry = book.binary_search("Gary")
			expect(entry).to be_a Entry
		end
		it "searches AddressBook for Philip" do
			entry = book.binary_search("Philip")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Arun" do
			entry = book.binary_search("Arun")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Mike" do
			entry = book.binary_search("Mike")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Sharon" do
			entry = book.binary_search("Sharon")
			expect(entry).to be_a Entry
		end

		it "searches AddressBook for Jack" do
       entry = book.binary_search("Jack")
       expect(entry).to be_nil
    end
	end
end
