using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;
using System;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Missions_Collection_PointsController : Controller
    {
        private readonly DbHelper _dbHelper;

        public Missions_Collection_PointsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Missions_Collection_PointsController>
        [HttpGet]
        public ActionResult<IEnumerable<Missions_Collection_Points>> Get()
        {
            return _dbHelper.Missions_Collection_Points.Include(l => l.Missions).Include(l => l.Collection_Points).ToArray();
        }

        // GET api/<Missions_Collection_PointsController>/5
        [HttpGet("{id}")]
        public ActionResult<Missions_Collection_Points> Get(int id)
        {
            var missions_collection_points = _dbHelper.Missions_Collection_Points.Find(id);
            if (missions_collection_points != null)
            {
                return missions_collection_points;
            }
            return NotFound();
        }

        //POST api/<Missions_Collection_PointsController>
        [HttpPost]
        public ActionResult<Missions_Collection_Points> Post([FromBody] Missions_Collection_Points value)
        {
            _dbHelper.Missions_Collection_Points.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_mission }, value);
        }



        // PUT api/<Missions_Collection_PointsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Missions_Collection_Points value)
        {
            if (id != value.id_mission)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Missions_Collection_PointsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var missions_collection_points = _dbHelper.Missions_Collection_Points.Find(id);
            if (missions_collection_points != null)
            {
                _dbHelper.Missions_Collection_Points.Remove(missions_collection_points);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}

