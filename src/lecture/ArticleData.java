package lecture;

public class ArticleData {
	
	private Article article;
	private ArticleContent content;
	
	public ArticleData(Article article, ArticleContent content) {
		
		this.article = article;
		this.content = content;
	}

	public Article getArticle() {
		return article;
	}

	public ArticleContent getContent() {
		return content;
	}
	
	
}
