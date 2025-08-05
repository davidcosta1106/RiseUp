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
    public class UsersController : Controller
    {
        private readonly DbHelper _dbHelper;

        public UsersController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<UsersController>
        [HttpGet]
        public ActionResult<IEnumerable<Users>> Get()
        {
            return _dbHelper.Users.ToArray();
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public ActionResult<Users> Get(int id)
        {
            var users = _dbHelper.Users.Find(id);
            if (users != null)
            {
                return users;
            }
            return NotFound();
        }

        //POST api/<UsersController>
        [HttpPost]
        public ActionResult<Users> Post([FromBody] Users value)
        {
            _dbHelper.Users.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_user }, value);
        }



        // PUT api/<UsersController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Users value)
        {
            if (id != value.id_user)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var users = _dbHelper.Users.Find(id);
            if (users != null)
            {
                _dbHelper.Users.Remove(users);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }
}

