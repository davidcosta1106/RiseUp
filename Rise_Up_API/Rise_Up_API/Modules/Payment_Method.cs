using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Rise_Up_API.Modules
{
    public class Payment_Method
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_payment_method { get; set; }
        public string payment_method_name { get; set; }
        [JsonIgnore]
        public virtual ICollection<Monetary_Donations>? monetary_donations { get; }
    }
}
