using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EventsManagerModels.MetaData
{
    class MarriageMetadata
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="Please select required user name")]
        [Display(Name ="Employee Id")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage ="Please Enter Employee Marriage Date")]
        [Display(Name ="Marriage Date")]
        [DataType(DataType.Date,ErrorMessage ="It's not a date, please see the format")]
        public System.DateTime DateOfMarriage { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
