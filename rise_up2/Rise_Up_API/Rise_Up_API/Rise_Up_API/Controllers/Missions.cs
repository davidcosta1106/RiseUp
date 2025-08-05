using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MissionsController : ControllerBase
    {
        private readonly DbHelper _dbHelper;

        public MissionsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<MissionsController>
        [HttpGet]
        public ActionResult<IEnumerable<Missions>> Get()
        {
            return _dbHelper.Missions.ToArray();
        }

        // GET api/<MissionsController>/5
        [HttpGet("{id}")]
        public ActionResult<Missions> Get(int id)
        {
            var jogador = _dbHelper.Missions.Find(id);
            if (jogador != null)
            {
                return jogador;
            }
            return NotFound();
        }

        //POST api/<MissionsController>
        [HttpPost]
        public ActionResult<Missions> Post([FromBody] Missions value)
        {
            _dbHelper.Missions.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_mission }, value);
        }


        //[HttpPost]
        //public ActionResult<Missions> Post([FromBody] MissionsPostViewModel viewModel)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        Missions jogador = new Missions
        //        {
        //            mission_name = viewModel.mission_name,
        //            date_mission = viewModel.date_mission,
        //            locality = viewModel.locality,
        //            state = viewModel.state,
        //            description_mission = viewModel.description_mission,
        //            finaced_amount = viewModel.financed_amount,
        //        };

        //        _dbHelper.Missions.Add(jogador);
        //        _dbHelper.SaveChanges();

        //        return CreatedAtAction(nameof(Get), new { id = jogador.id_mission }, jogador);
        //    }
        //    else
        //    {
        //        return BadRequest(ModelState);
        //    }
        //}


        // PUT api/<MissionsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Missions value)
        {
            if (id != value.id_mission)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<MissionsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var missions = _dbHelper.Missions.Find(id);
            if (missions != null)
            {
                _dbHelper.Missions.Remove(missions);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}
