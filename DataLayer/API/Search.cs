using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace DataLayer.API
{
    public class Search 
    {
        public static async Task<List<Author>> GetAllAuthors()
        {
            using (LibraryEntities entities = new LibraryEntities())
            {
                var authors = from autor in entities.Authors select autor;
                return await authors.ToListAsync();
            }
        }


        public static async Task<List<Book>> GetAllBooks()
        {
            using (LibraryEntities entities = new LibraryEntities())
            {
                entities.Configuration.LazyLoadingEnabled = true;
                var books = from book in entities.Books.Include("Author").Include("Category") select book;
                return await books.ToListAsync();
            }

        }

        public static async Task<List<Book>> GetByAuthor(Author author)
        {
            using (LibraryEntities entities = new LibraryEntities())
            {
                entities.Configuration.LazyLoadingEnabled = true;
                var books = entities.Books.Include("Author").Include("Category").Where(x => x.Author.id == author.id);
                return await books.ToListAsync();
            }
            
        }
        public static async Task<List<Book>> GetByCategory(Category category)
        {
            using (LibraryEntities entities = new LibraryEntities())
            {
                entities.Configuration.LazyLoadingEnabled = true;
                var books = entities.Books.Include("Author").Include("Category").Where(x => x.Category.id == category.id);
                return await books.ToListAsync();
            }
        }


    }
}
