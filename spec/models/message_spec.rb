require 'rails_helper'

describe Message do
  it { should validate_presence_of :body }
  it { should validate_presence_of :favorite }
  it { should belong_to :user }
end
