# require 'faker'

RSpec.describe 'GET /api/articles/:id', type: :request do
  let!(:user) { create(:user, email: Faker::Internet.email) }
  let!(:article) { create(:article) }
  # let(:comment) { create(:comment) }
  let(:member_credentials) { user.create_new_auth_token }

  subject { repsonse }

  describe 'Succesfull - article can have a comment by an authenticatd user' do
    before do
      post "/api/articles/#{article.id}/comments", params: {
        comment: { body: 'article comment' }
      }, headers: member_credentials
      @article = Article.last
      @comment = article.comments.first
    end

    it 'is expected to return a 201 response' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return the article with the comment ' do
      expect(article['id']).to eq article.id
    end

    it 'is expected to return a comment id  ' do
      expect(comment['id']).to eq comment.id
    end

    it 'it is expected an articles will include a comment' do
      expect(comment['body']).to eq 'article comment'
    end
  end

  describe 'Unsucesful no comment by an unauthenticatd user' do
    let!(:article) { create(:article) }
    let(:comment) { create(:comment) }
    before do
      post "/api/articles/#{article.id}/comments", params: {
        comment: { article: article.id,
                   comment_id: comment.id }
      }
    end

    it 'is expected to return a 401 response' do
      expect(response).to have_http_status 401
    end
  end
end
