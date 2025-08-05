using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssociationsController : Controller
    {
        private readonly DbHelper _dbHelper;

        public AssociationsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<AssociationsController>
        [HttpGet]
        public ActionResult<IEnumerable<Associations>> Get()
        {
            return _dbHelper.Associations.ToArray();
        }

        // GET api/<AssociationsController>/5
        [HttpGet("{id}")]
        public ActionResult<Associations> Get(int id)
        {
            var associations = _dbHelper.Associations.Find(id);
            if (associations != null)
            {
                return associations;
            }
            return NotFound();
        }

        //POST api/<AssociationsController>
        [HttpPost]
        public ActionResult<Associations> Post([FromBody] Associations value)
        {
            _dbHelper.Associations.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_association }, value);
        }



        // PUT api/<AssociationsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Associations value)
        {
            if (id != value.id_association)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<AssociationsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var associations = _dbHelper.Associations.Find(id);
            if (associations != null)
            {
                _dbHelper.Associations.Remove(associations);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}
