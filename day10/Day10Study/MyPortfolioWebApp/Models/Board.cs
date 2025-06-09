using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyPortfolioWebApp.Models;

[Table("Board")] // 실제 DB 테이블명 지정 (한글 사용)
public class Board
{
    [Key]
    [DisplayName("번호")]
    public int Id { get; set; }

    [Required(ErrorMessage = "{0}은 필수입니다.")]
    [DisplayName("이메일")]
    public string Email { get; set; }

    [DisplayName("작성자")]
    [BindNever]
    public string? Writer { get; set; }

    [Required(ErrorMessage = "{0}은 필수입니다.")]
    [DisplayName("제목")]
    public string Title { get; set; }

    [Required(ErrorMessage = "{0}은 필수입니다.")]
    [DisplayName("내용")]
    public string Contents { get; set; }

    [DisplayName("작성일")]
    [DisplayFormat(DataFormatString = "{0:yyyy년 MM월 dd일}", ApplyFormatInEditMode = true)]
    [BindNever]
    public DateTime? PostDate { get; set; }

    [DisplayName("조회수")]
    [BindNever]
    public int? ReadCount { get; set; }
}
