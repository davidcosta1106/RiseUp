using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Association_MissionController : Controller
    {

        private readonly DbHelper _dbHelper;

        public Association_MissionController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Association_MissionController>
        [HttpGet]
        public ActionResult<IEnumerable<Association_Mission>> Get()
        {
            return _dbHelper.Association_Mission.Include(l => l.Missions).Include(l => l.Associations).ToArray();
        }

        // GET api/<Association_MissionController>/5
        [HttpGet("{id}")]
        public ActionResult<Association_Mission> Get(int id)
        {
            var association_mission = _dbHelper.Association_Mission.Find(id);
            if (association_mission != null)
            {
                return association_mission;
            }
            return NotFound();
        }

        //POST api/<Association_MissionController>
        [HttpPost]
        public ActionResult<Association_Mission> Post([FromBody] Association_Mission value)
        {
            _dbHelper.Association_Mission.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_mission }, value);
        }



        // PUT api/<Association_MissionController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Association_Mission value)
        {
            if (id != value.id_mission)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Association_MissionController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var association_mission = _dbHelper.Association_Mission.Find(id);
            if (association_mission != null)
            {
                _dbHelper.Association_Mission.Remove(association_mission);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}
