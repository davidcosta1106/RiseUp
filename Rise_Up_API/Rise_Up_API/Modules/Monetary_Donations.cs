using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Rise_Up_API.Modules
{
    public class Monetary_Donations
    {
            [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
            [Key] public int id_monetary_donation { get; set; }
            public int id_mission { get; set; }
            public int id_user { get; set; }
            public int id_association { get; set; }
            public int id_payment_method { get; set; }
            public int monetary_value { get; set; }
            public DateTime date_donation { get; set; }
            public Missions Missions { get; set; }
            public Users Users { get; set; }
            public Associations Associations { get; set; }
            public Payment_Method Payment_Method { get; set; }
        }
    }

