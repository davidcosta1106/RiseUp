using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    public class Payment_MethodController : Controller
    {
        private readonly DbHelper _dbHelper;

        public Payment_MethodController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Payment_MethodController>
        [HttpGet]
        public ActionResult<IEnumerable<Payment_Method>> Get()
        {
            return _dbHelper.Payment_Method.ToArray();
        }

        // GET api/<Payment_MethodController>/5
        [HttpGet("{id}")]
        public ActionResult<Payment_Method> Get(int id)
        {
            var payment_method = _dbHelper.Payment_Method.Find(id);
            if (payment_method != null)
            {
                return payment_method;
            }
            return NotFound();
        }

        //POST api/<Payment_MethodController>
        [HttpPost]
        public ActionResult<Payment_Method> Post([FromBody] Payment_Method value)
        {
            _dbHelper.Payment_Method.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_payment_method }, value);
        }



        // PUT api/<Payment_MethodController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Payment_Method value)
        {
            if (id != value.id_payment_method)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Payment_MethodController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var payment_method = _dbHelper.Payment_Method.Find(id);
            if (payment_method != null)
            {
                _dbHelper.Payment_Method.Remove(payment_method);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
 }

