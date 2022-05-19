RSpec.describe 'GET /api/articles/:id', type: :request do
    let!(:article) { create(:article) }


    describe 'Article can have a comment added' do
      before do
        post "/api/articles/#{article.id}/comments", params: {
            comment: {body: "Great read", article: article.id}
        }
      end
    
  
      it 'is expected to return a 201 response' do
        expect(response).to have_http_status 201
      end
  
      it 'is expected to return the correct article' do
        expect(response_json['article']['id']).to eq article.id
      end
  
      # it 'it is expected an arties will include a comment' do
      #   expect(response_json['article']['comment']).to exist
      # end

    end

end
  