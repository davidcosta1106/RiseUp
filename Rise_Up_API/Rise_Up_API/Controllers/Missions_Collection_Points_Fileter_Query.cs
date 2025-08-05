using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rise_Up_API.Helpers;
using Rise_Up_API.Modules;

namespace Rise_Up_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Missions_Collection_Points_Fileter_QueryController : Controller
    {
        [HttpGet]
        public IActionResult GetPalyersQuery()
        {
            using (var db = new DbHelper())
            {
                var query = from m in db.Missions
                            join mcp in db.Missions_Collection_Points on m.id_mission equals mcp.id_mission
                            join cp in db.Collection_Points on mcp.id_collection_point equals cp.id_collection_point
                            
                            select new Missions_Collection_Points_Fileter_Query
                            {
                                id_mission = m.id_mission,
                                mission_name = m.mission_name,
                                collection_point_name = cp.collection_point_name,
                                postal_code = cp.postal_code,
                                district = cp.district,
                                city = cp.city,
                                country = cp.country,
                                stret = cp.street,
                                number_door = cp.number_door,
                                initial_hour = cp.inicial_hour,
                                end_hour = cp.end_hour,
                                week_days = cp.week_days,


                            };
                return Ok(query.ToList());

            }
        }
    }
}
