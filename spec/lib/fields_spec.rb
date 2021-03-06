require 'spec_helper'

describe "Fields" do

end

describe "Field" do

  it "#model" do
    field = Puffer::Fields::Field.new 'user.profile.name', Post
    field.model.should == Profile
    field = Puffer::Fields::Field.new 'user.email', Post
    field.model.should == User
    field = Puffer::Fields::Field.new 'user', Post
    field.model.should == Post
    field = Puffer::Fields::Field.new 'title', Post
    field.model.should == Post
  end

  it "#name" do
    field = Puffer::Fields::Field.new 'user.profile.name', Post
    field.name.should == 'name'
  end

  it "#query_column" do
    field = Puffer::Fields::Field.new 'user.profile.name', Post
    field.query_column.should == 'profiles.name'
    field = Puffer::Fields::Field.new 'user.email', Post
    field.query_column.should == 'users.email'
    field = Puffer::Fields::Field.new 'user.full_name', Post
    field.query_column.should == nil
  end

  it "#column" do
    field = Puffer::Fields::Field.new 'user.profile.name', Post
    field.column.name.should == 'name'
    field = Puffer::Fields::Field.new 'user.full_name', Post
    field.column.should == nil
  end

  it '#type' do
    field = Puffer::Fields::Field.new 'user.created_at', Post
    field.type.should == :datetime
  end

  it '#type with virtual field' do
    field = Puffer::Fields::Field.new 'user.full_name', Post
    field.type.should == :string
  end

  it '#type was specified' do
    field = Puffer::Fields::Field.new 'user.full_name', Post, :type => :text
    field.type.should == :text
  end

end
