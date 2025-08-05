using System.ComponentModel.DataAnnotations;

namespace Rise_Up_API.Modules
{
    public class Missions_Collection_Points
    {
        [Key]
        public int id_mission {get;set;}
        public int id_collection_point { get;set;}
        public Missions Missions { get; set; } = null!;
        public Collection_Points Collection_Points { get; set; } = null!;
    }
}
