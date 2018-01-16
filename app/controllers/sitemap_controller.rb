class SitemapController < ApplicationController
  def index
    @static_pages = [root_url]
    @snippets = Snippet.all
    @posts = Post.all
    respond_to do |format|
      format.xml
    end
  end
end
