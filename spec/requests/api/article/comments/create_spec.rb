RSpec.describe 'POST /api/articles', type: :request do
  let!(:comment){ create(:comment) }
  
  subject{ reponse }
  
  before do 
    post"/api/articles",params:{
      commeit:{body:"I can pass this test"},
    }
    @comment =Comment.last
  end 

  it "is_expected.to have_http_status 201" do
    expect(response).to have_http_status :created
  end

  it 'is expected to create instance of an Commeit' do 
    expect(@comment).not_to be nil
  end 
  
  it "is expected to have a body" do
    expect(@comment.body).to eq "I can pass this test"
  end
end
