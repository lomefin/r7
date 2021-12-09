module ArticlesHelper
  NOTICE = {
    create: 'Article created successfully',
    update: 'Article updated successfully',
    delete: 'Article deleted successfully',
    like: 'Article has been liked',
    error: 'Something went wrong'
  }.freeze

  def notice_stream(message:, status:)
    turbo_stream.replace 'notice', partial: 'notice', locals: { notice: NOTICE[message], status: status }
  end

  def form_article_stream(article:)
    turbo_stream.replace 'form', partial: 'form', locals: { article: article }
  end
end
