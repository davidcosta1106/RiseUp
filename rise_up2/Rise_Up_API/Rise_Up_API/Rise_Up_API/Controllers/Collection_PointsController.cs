using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Collection_PointsController : Controller
    {
        private readonly DbHelper _dbHelper;

        public Collection_PointsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Collection_PointsController>
        [HttpGet]
        public ActionResult<IEnumerable<Collection_Points>> Get()
        {
            return _dbHelper.Collection_Points.ToArray();
        }

        // GET api/<Collection_PointsController>/5
        [HttpGet("{id}")]
        public ActionResult<Collection_Points> Get(int id)
        {
            var collection_points = _dbHelper.Collection_Points.Find(id);
            if (collection_points != null)
            {
                return collection_points;
            }
            return NotFound();
        }

        //POST api/<Collection_PointsController>
        [HttpPost]
        public ActionResult<Collection_Points> Post([FromBody] Collection_Points value)
        {
            _dbHelper.Collection_Points.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_collection_point }, value);
        }



        // PUT api/<Collection_PointsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Collection_Points value)
        {
            if (id != value.id_collection_point)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Collection_PointsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var collection_points = _dbHelper.Collection_Points.Find(id);
            if (collection_points != null)
            {
                _dbHelper.Collection_Points.Remove(collection_points);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}

