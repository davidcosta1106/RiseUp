using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Rise_Up_API.Modules
{
    public class Associations
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_association { get; set; }
        public string association_name { get; set; }
        public string base_district { get; set; }
        public string base_country { get; set; }
        public string iban { get; set; }

        [JsonIgnore]
        public virtual ICollection<Monetary_Donations>? monetary_donations { get; }

        [JsonIgnore]
        public virtual ICollection<Association_Mission>? association_mission { get; }
    }
}
