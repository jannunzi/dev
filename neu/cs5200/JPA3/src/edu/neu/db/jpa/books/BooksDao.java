package edu.neu.db.jpa.books;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BooksDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPA3");
	
	public List<Book> getBooksForAuthor(int authorId) {
		List<Book> books = new ArrayList<Book>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, authorId);
		books = author.getBooks();
		
		em.getTransaction().commit();
		em.close();
		return books;
	}
	
	public void authorWroteBook(int authorId, int bookId) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, authorId);
		Book   book   = em.find(Book.class, bookId);

		author.getBooks().add(book);
		em.merge(author);
		
		book.setAuthor(author);
		em.merge(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createAuthor(Author author) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(author);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void createBook(Book book) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void template() {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void authorLikesBook(int authorId, int bookId, Likes likes) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(likes);
		
		Author author = em.find(Author.class, authorId);
		Book   book   = em.find(Book.class, bookId);
		
		likes.setBook(book);
		likes.setAuthor(author);
		em.merge(likes);
		
		author.getLikes().add(likes);
		em.merge(author);
		
		book.getLikes().add(likes);
		em.merge(book);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Likes> whatBookDoesAuthorLike(int authorId) {
		List<Likes> likes = new ArrayList<Likes>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Author author = em.find(Author.class, authorId);
		likes = author.getLikes();
		
		em.getTransaction().commit();
		em.close();
		return likes;
	}
	
	public List<Likes> whatAuthorsLikeThisBook(int bookId) {
		List<Likes> likes = new ArrayList<Likes>();
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();

		Book book = em.find(Book.class, bookId);
		likes = book.getLikes();
		
		em.getTransaction().commit();
		em.close();
		return likes;
	}
	
	public void authorNoLongerLikesBook(int authorId, int bookId) {
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		// find the author that no longer likes the book:
		Author author = em.find(Author.class, authorId);
		System.out.print(author.getFirstName());
		System.out.println(" currently likes these Books:");
		List<Likes> likes = author.getLikes();
		for(Likes authorLikes: likes)
		{
			Book bookLiked = authorLikes.getBook();
			System.out.println(bookLiked.getTitle());
		}

		// find the book that the author no longer likes
		System.out.println("-------------------");
		System.out.print(author.getFirstName());
		System.out.println(" no Longer Likes:");
		Book bookNotLiked = em.find(Book.class, bookId);
		System.out.println(bookNotLiked.getTitle());
		
		// Search for the like we want to remove by looking for the book the author no longer likes
		Likes removeLikes = null;
		for(Likes authorLikes: likes)
		{
			Book bookLiked = authorLikes.getBook();
			if(bookLiked.equals(bookNotLiked))
			{
				removeLikes = authorLikes;
			}
		}
		
		// now that we know the likes we want to remove find the likes by id from database
		removeLikes = em.find(Likes.class, removeLikes.getId());
		System.out.println(removeLikes.getAuthor().getFirstName());
		System.out.println(removeLikes.getBook().getTitle());

		// remove likes from author
		author.getLikes().remove(removeLikes);
		em.persist(author);
		// remove likes from book
		bookNotLiked.getLikes().remove(removeLikes);
		em.persist(bookNotLiked);
		// remove likes mapping
		em.remove(removeLikes);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public static void main(String[] args) {
		
		BooksDao dao = new BooksDao();
		
		
		dao.authorNoLongerLikesBook(1, 3);
		System.out.println("==================");
		
		System.out.println("Authors that like Dune");
		List<Likes> likesFromBook = dao.whatAuthorsLikeThisBook(3);
		for(Likes like:likesFromBook) {
			System.out.println(like.getAuthor().getFirstName());
			System.out.println(like.getComment());
			System.out.println(like.getStars());
		}

		System.out.println("Books that Robin Cook Likes");
		List<Likes> likes = dao.whatBookDoesAuthorLike(1);
		for(Likes like : likes) {
			System.out.println(like.getBook().getTitle());
			System.out.println(like.getComment());
			System.out.println(like.getStars());
			System.out.println("====");
		}
		/*
		Likes likes = new Likes();
		likes.setComment("Awesome Sci Fi Thriller");
		likes.setStars(5);
		dao.authorLikesBook(2, 3, likes);
		

		List<Book> books = dao.getBooksForAuthor(1);
		for(Book book : books) {
			System.out.println(book.getTitle());
		}

		dao.authorWroteBook(1, 2);
		
		Book book = new Book();
		book.setTitle("Contagion");		
		dao.createBook(book);
		
		Author author = new Author();
		author.setFirstName("Robin");
		author.setLastName("Cook");
		author.setSsn("123-32-3211");
		dao.createAuthor(author);
		*/
	}

}
