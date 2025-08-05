using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Monetary_DonationsController : Controller
    {
        private readonly DbHelper _dbHelper;

        public Monetary_DonationsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Monetary_DonationsController>
        [HttpGet]
        public ActionResult<IEnumerable<Monetary_Donations>> Get()
        {
            return _dbHelper.Monetary_Donations.Include(l => l.Missions).Include(l => l.Users).Include(l => l.Associations).Include(l => l.Payment_Method).ToArray();
        }

        // GET api/<Monetary_DonationsController>/5
        [HttpGet("{id}")]
        public ActionResult<Monetary_Donations> Get(int id)
        {
            var monetary_donations = _dbHelper.Monetary_Donations.Find(id);
            if (monetary_donations != null)
            {
                return monetary_donations;
            }
            return NotFound();
        }

        //POST api/<Monetary_DonationsController>
        [HttpPost]
        public ActionResult<Monetary_Donations> Post([FromBody] Monetary_Donations value)
        {
            _dbHelper.Monetary_Donations.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_monetary_donation }, value);
        }



        // PUT api/<Monetary_DonationsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Monetary_Donations value)
        {
            if (id != value.id_monetary_donation)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Monetary_DonationsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var monetary_donations = _dbHelper.Monetary_Donations.Find(id);
            if (monetary_donations != null)
            {
                _dbHelper.Monetary_Donations.Remove(monetary_donations);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}
