require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Comment do
  context "Associations" do
    it { should belong_to :subject, :polymorphic => true }
    it { should belong_to :user }
  end

  context "Validations" do
    it { should validate_presence_of :body, :user_id, :subject_id, :subject_type }
  end

  it 'cannot be created without a body, subject or user' do    
      comment = Comment.create
      comment.should_not be_valid
  end
  
  it 'can be created with a body, subject and user' do
    comment = Comment.create(:body => "Leon is a knucklehead", :subject_id => 1 , :subject_type => 'Presentation', :user_id => 16 )
    comment.should be_valid
  end

  it "should be a private comment" do
    @private_comment = Comment.new
    @private_comment.private = true
    @private_comment.should be_private
  end

  it "should be a public comment" do
    @public_comment = Comment.new
    @public_comment.private = false
    @public_comment.should_not be_private    
  end

  it "should start out with an empty (nil) comment" do
    @comment = Comment.new
    @comment.body.should be_nil        
  end
  
  it "should be able to store descriptive text" do
    @comment = Comment.new
    @comment.body="This is some text"
    @comment.body.should_not be_empty        
  end
  
end
