using Microsoft.EntityFrameworkCore;

namespace Rise_Up_API.Modules
{
    [Keyless]
    public class Missions_Collection_Points_Fileter_Query
    {
        public int id_mission { get; set; }
        public string mission_name { get; set; }
        public string collection_point_name { get; set; }
        public string postal_code { get; set; }
        public string district { get; set; }
        public string city { get; set; }
        public string country { get; set; }
        public string stret { get; set; }
        public int number_door { get; set; }
        public TimeSpan initial_hour { get; set; }
        public TimeSpan end_hour { get; set; }
        public string week_days { get; set; }
    }
}
