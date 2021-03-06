require "rails_helper"

describe Member do
  subject { Member.new(full_name: "Jonh Doe") }

  it "is valid" do
    expect(subject).to be_valid
  end

  it "sets joined_at" do
    expect { subject.save }.to change { subject.joined_at }
  end

  it "sets token" do
    expect { subject.save }.to change { subject.token }
  end

  it "sets uuid" do
    expect { subject.save }.to change { subject.id }
  end

  it "uses uuid" do
    subject.save!
    expect(subject.reload.id).to match %r[\b.{8}-.{4}-.{4}-.{4}-.{12}]
  end

  it "is valid without full_name" do
    subject.full_name = nil
    expect(subject).to be_valid
  end
end
