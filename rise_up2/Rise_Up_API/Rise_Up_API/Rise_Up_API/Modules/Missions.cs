using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Rise_Up_API.Modules
{
    public class Missions
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_mission { get; set; }
        public string mission_name { get; set;}
        public string description_mission { get; set; }
        public DateTime date_mission { get; set; }
        public string locality { get; set; }
        public string state_mission { get; set; }
        public int financed_amount { get; set; }
        [JsonIgnore]
        public virtual ICollection<Missions_Collection_Points>? missions_collection_points { get; }
    }
}
