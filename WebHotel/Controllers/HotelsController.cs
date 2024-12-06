using Microsoft.EntityFrameworkCore;
using WebHotel.Classes;
using Microsoft.AspNetCore.Mvc;
using WebHotel;

[Route("api/[controller]")]
[ApiController]
public class HotelsController : ControllerBase
{ 
    private readonly HotelDbContext _context;

    public HotelsController(HotelDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Service>>> GetAllServices()
    {
        var services = await _context.Services.ToListAsync();

        if (services == null || !services.Any())
        {
            return NotFound("Клиенты не найдены");
        }

        return Ok(services);  // Возвращаем 200 OK с данными клиентов
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Service>> GetServiceById(int id)
    {
        var service = await _context.Services.FindAsync(id);

        if (service == null)
        {
            return NotFound();  // Возвращаем 404, если клиент не найден
        }

        return Ok(service);  // Возвращаем 200 OK с данными клиента
    }

    //[HttpGet]
    //public async Task<ActionResult<IEnumerable<Service>>> GetAllRooms()
    //{
    //    var rooms = await _context.Rooms.ToListAsync();

    //    if (rooms == null || !rooms.Any())
    //    {
    //        return NotFound("Клиенты не найдены");
    //    }

    //    return Ok(rooms);  // Возвращаем 200 OK с данными клиентов
    //}

    [HttpPost]
    public async Task<IActionResult> CreateRoom(Room room)
    {
        _context.Rooms.Add(room);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetServiceById), new { id = room.IdRooms }, room);  // Возвращаем 201 Created
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateRoom(int id, [FromBody] Room room)
    {
        if (id != room.IdRooms)
        {
            // Возвращаем ошибку, если ID в URL не совпадает с ID в теле запроса
            return BadRequest("ID в маршруте не совпадает с ID в теле запроса.");
        }

        _context.Entry(room).State = EntityState.Modified;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.Rooms.Any(e => e.IdRooms == id))
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

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteService(int id)
    {
        var service = await _context.Services.FindAsync(id);
        if (service == null)
        {
            return NotFound();  // Возвращаем 404, если клиент не найден
        }

        _context.Services.Remove(service);
        await _context.SaveChangesAsync();

        return NoContent();  // Возвращаем 204 No Content, если удаление прошло успешно
    }

    // Проверка, существует ли клиент с указанным ID
    private bool ServiceExists(int id)
    {
        return _context.Services.Any(e => e.IdServices == id);  // Проверка, существует ли клиент с данным ID
    }
}