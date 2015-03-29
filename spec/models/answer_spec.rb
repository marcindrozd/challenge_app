require 'spec_helper'

describe Answer do
  it { should validate_presence_of(:contents) }
end
