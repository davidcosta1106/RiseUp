using System.ComponentModel.DataAnnotations;

namespace Rise_Up_API.Modules
{
    public class Association_Mission
    {

        [Key]
        public int id_mission { get; set; }
        public int id_association { get; set; }
        public Missions Missions { get; set; }
        public Associations Associations { get; set; }
    }
}
