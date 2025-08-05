using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace Rise_Up_API.Modules
{
    public class Users
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_user {get; set;}
        public string user_name_ { get; set;}
        public string e_mail { get; set;}
        public string pass_word { get; set;}
        [JsonIgnore]
        public virtual ICollection<Monetary_Donations>? monetary_donations { get; }

    }
}
