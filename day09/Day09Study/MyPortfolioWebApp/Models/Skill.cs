using System.ComponentModel.DataAnnotations;

namespace MyPortfolioWebApp.Models
{
    public class Skill
    {
        [Key]
        public int Id { get; set; }

        public string Language { get; set; }

        public string Level { get; set; }
    }
}
