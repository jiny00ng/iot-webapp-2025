using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyPortfolioWebApp.Models;

namespace MyPortfolioWebApp.Controllers
{
    public class BoardController : Controller
    {
        private readonly ApplicationDbContext _context;

        public BoardController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Board
        public async Task<IActionResult> Index(int page = 1, string search = null)
        {
            int pageSize = 10; // 한 페이지당 게시글 개수

            IQueryable<Board> query = _context.Board;

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(b => b.Title.Contains(search) || b.Writer.Contains(search) || b.Contents.Contains(search));
            }

            int totalCount = await query.CountAsync();
            int totalPage = (int)Math.Ceiling(totalCount / (double)pageSize);

            // 페이징을 위한 시작, 끝 페이지 계산 (예: 1~5 페이지 버튼만 보여주기)
            int pageGroupSize = 5;
            int startPage = ((page - 1) / pageGroupSize) * pageGroupSize + 1;
            int endPage = Math.Min(startPage + pageGroupSize - 1, totalPage);

            var boards = await query
                .OrderByDescending(b => b.PostDate)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.Page = page;
            ViewBag.TotalPage = totalPage;
            ViewBag.StartPage = startPage;
            ViewBag.EndPage = endPage;
            ViewBag.Search = search;

            return View(boards);
        }



        // GET: Board/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
                return NotFound();

            var board = await _context.Board.FirstOrDefaultAsync(m => m.Id == id);

            if (board == null)
                return NotFound();

            // 조회수 증가
            board.ReadCount = (board.ReadCount ?? 0) + 1;
            _context.Board.Update(board);
            await _context.SaveChangesAsync();

            return View(board);
        }

        // GET: Board/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Board/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Email,Writer,Title,Contents")] Board board)
        {
            if (ModelState.IsValid)
            {
                board.PostDate = DateTime.Now;
                board.ReadCount = 0;

                _context.Add(board);
                await _context.SaveChangesAsync();
                TempData["success"] = "게시글이 성공적으로 등록되었습니다.";
                return RedirectToAction(nameof(Index));
            }
            return View(board);
        }

        // GET: Board/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
                return NotFound();

            var board = await _context.Board.FindAsync(id);
            if (board == null)
                return NotFound();

            return View(board);
        }

        // POST: Board/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Email,Writer,Title,Contents")] Board board)
        {
            if (id != board.Id)
                return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    var existing = await _context.Board.FindAsync(id);
                    if (existing == null)
                        return NotFound();

                    existing.Email = board.Email;
                    existing.Writer = board.Writer;
                    existing.Title = board.Title;
                    existing.Contents = board.Contents;

                    _context.Update(existing);
                    await _context.SaveChangesAsync();
                    TempData["success"] = "게시글이 수정되었습니다.";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BoardExists(board.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(board);
        }

        // GET: Board/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
                return NotFound();

            var board = await _context.Board.FirstOrDefaultAsync(m => m.Id == id);
            if (board == null)
                return NotFound();

            return View(board);
        }

        // POST: Board/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var board = await _context.Board.FindAsync(id);
            if (board != null)
            {
                _context.Board.Remove(board);
                await _context.SaveChangesAsync();
                TempData["success"] = "게시글이 삭제되었습니다.";
            }

            return RedirectToAction(nameof(Index));
        }

        private bool BoardExists(int id)
        {
            return _context.Board.Any(e => e.Id == id);
        }
    }
}