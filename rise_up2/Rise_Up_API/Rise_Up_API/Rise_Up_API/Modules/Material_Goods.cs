using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Rise_Up_API.Modules
{
    public class Material_Goods
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key] public int id_material_good { get; set; }
        public string material_good_name { get; set; }
    }
}
