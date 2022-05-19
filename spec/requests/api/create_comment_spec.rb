RSpec.describe 'GET /api/articles/:id', type: :request do
  let!(:article) { create(:article) }
  let(:comment) { create(:comment) }

  subject { repsonse }

  describe 'Article can have a comment added' do
    before do
      post "/api/articles/#{article.id}/comments", params: {
        comment: { article: article.id, comment_id: comment.id }
      }
      @article = Article.last
    end

    it 'is expected to return a 201 response' do
      expect(response).to have_http_status 201
      binding.pry
    end

    it 'is expected to return the article with the comment ' do
      expect(article['id']).to eq article.id
    end

    it 'is expected to return a comment id  ' do
      expect(comment['id']).to eq comment.id
    end

    it 'it is expected an articles will include a comment' do
      expect(comment['body']).to eq "article comment"
    end
  end
end
