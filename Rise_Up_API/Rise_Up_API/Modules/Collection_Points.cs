using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Rise_Up_API.Modules
{
    public class Collection_Points
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_collection_point { get; set; }
        public string collection_point_name { get; set; }
        public string postal_code { get; set; }
        public string district { get; set; }
        public string city { get; set; }
        public string country { get; set; }
        public string street { get; set; }
        public int number_door { get; set; }
        public TimeSpan inicial_hour { get; set; }
        public TimeSpan end_hour { get; set; }
        public string week_days { get; set; }
        [JsonIgnore]
        public virtual ICollection<Missions_Collection_Points>? missions_collection_points { get; }


    }
}
