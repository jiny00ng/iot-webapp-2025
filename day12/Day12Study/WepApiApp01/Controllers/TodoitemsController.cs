using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WepApiApp01.Models;

namespace WepApiApp01.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoitemsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TodoitemsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Todoitems
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Todoitems>>> GetTodoitems()
        {
            return await _context.Todoitems.ToListAsync();
        }

        // GET: api/Todoitems/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Todoitems>> GetTodoitems(int id)
        {
            var todoitems = await _context.Todoitems.FindAsync(id);

            if (todoitems == null)
            {
                return NotFound();
            }

            return todoitems;
        }

        // PUT: api/Todoitems/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTodoitems(int id, Todoitems todoitems)
        {
            if (id != todoitems.Id)
            {
                return BadRequest();
            }

            _context.Entry(todoitems).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TodoitemsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Todoitems
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Todoitems>> PostTodoitems(Todoitems todoitems)
        {
            _context.Todoitems.Add(todoitems);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTodoitems", new { id = todoitems.Id }, todoitems);
        }

        // DELETE: api/Todoitems/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTodoitems(int id)
        {
            var todoitems = await _context.Todoitems.FindAsync(id);
            if (todoitems == null)
            {
                return NotFound();
            }

            _context.Todoitems.Remove(todoitems);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TodoitemsExists(int id)
        {
            return _context.Todoitems.Any(e => e.Id == id);
        }
    }
}
