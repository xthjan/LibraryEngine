using DataLayer;
using DataLayer.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Library
{

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private async void LoadData()
        {
            ddlAuthor.DataSource = await Search.GetAllAuthors();
            ddlAuthor.DataTextField = "name";
            ddlAuthor.DataValueField = "id";
            ddlAuthor.DataBind();
            ddlAuthor.Items.Insert(0, new ListItem("Select...", "0"));
            List<Book> books = await Search.GetAllBooks();
            LoadBooks(books);
        }
         
        protected async void ddlAuthor_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Book> books = new List<Book>();
            if (ddlAuthor.SelectedValue != "0")
            {
                Author author = new Author() { id = Guid.Parse(ddlAuthor.SelectedValue) };
                books = await Search.GetByAuthor(author);
                LoadBooks(books);
            }
            else
            {
                books = await Search.GetAllBooks();
                LoadBooks(books);
            }
        }

        public void LoadBooks(List<Book> books)
        {
            repBooks.DataSource = books;
            repBooks.DataBind();
        }

    }
}