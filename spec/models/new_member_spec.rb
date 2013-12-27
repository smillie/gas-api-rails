require 'spec_helper'

describe NewMember do
  before { @new_member = NewMember.new(firstname: "Example", lastname: "Member", email: "user@example.com", studentnumber: "200805213") }

    subject { @new_member }

    it { should respond_to(:firstname) }
    it { should respond_to(:lastname) }
    it { should respond_to(:email) }
    it { should respond_to(:studentnumber) } 
    
    describe "when firstname is not present" do
      before { @new_member.firstname = " " }
      it {should_not be_valid}
    end
    
    describe "when lastname is not present" do
      before { @new_member.lastname = " " }
      it {should_not be_valid}
    end
    
    describe "when email address is not present" do
      before { @new_member.email = " " }
      it {should_not be_valid}
    end
    
    describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                        foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @new_member.email = invalid_address
          expect(@new_member).not_to be_valid
        end
      end
    end
     
    describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @new_member.email = valid_address
          expect(@new_member).to be_valid
        end
      end
    end
    
    describe "when email address is already registered" do
      before do
        member_with_same_email = @new_member.dup
        member_with_same_email.email = @new_member.email.upcase
        member_with_same_email.save
      end

      it { should_not be_valid }
    end
    
    describe "when studentnumber is not present" do
      before { @new_member.studentnumber = nil }
      it {should be_valid}
    end
    
    describe "when studentnumber is too long" do
      before { @new_member.studentnumber = "1"*10 }
      it {should_not be_valid}
    end
    
    describe "when studentnumber is too short" do
      before { @new_member.studentnumber = "1" }
      it {should_not be_valid}
    end
    
    describe "when studentnumber is not numeric" do
      before { @new_member.studentnumber = "abc123abc" }
      it {should_not be_valid}
    end
end
