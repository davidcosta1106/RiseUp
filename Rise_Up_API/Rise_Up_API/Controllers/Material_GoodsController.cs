using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Material_GoodsController : Controller
    {
        private readonly DbHelper _dbHelper;

        public Material_GoodsController(DbHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        // GET: api/<Material_GoodsController>
        [HttpGet]
        public ActionResult<IEnumerable<Material_Goods>> Get()
        {
            return _dbHelper.Material_Goods.ToArray();
        }

        // GET api/<Material_GoodsController>/5
        [HttpGet("{id}")]
        public ActionResult<Material_Goods> Get(int id)
        {
            var material_goods = _dbHelper.Material_Goods.Find(id);
            if (material_goods != null)
            {
                return material_goods;
            }
            return NotFound();
        }

        //POST api/<Material_GoodsController>
        [HttpPost]
        public ActionResult<Missions> Post([FromBody] Material_Goods value)
        {
            _dbHelper.Material_Goods.Add(value);
            _dbHelper.SaveChanges();
            return CreatedAtAction(nameof(Get), new { id = value.id_material_good }, value);
        }



        // PUT api/<Material_GoodsController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Material_Goods value)
        {
            if (id != value.id_material_good)
            {
                return BadRequest();
            }

            _dbHelper.Entry(value).State = EntityState.Modified;
            _dbHelper.SaveChanges();

            return NoContent();
        }

        // DELETE api/<Material_GoodsController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var material_goods = _dbHelper.Material_Goods.Find(id);
            if (material_goods != null)
            {
                _dbHelper.Material_Goods.Remove(material_goods);
                _dbHelper.SaveChanges();
                return NoContent();
            }
            return NotFound();
        }
    }

}

