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
        [Required(ErrorMessage ="Please select colleague name")]
        [Display(Name ="Employee Id")]
        public int EmployeeID { get; set; }
        [Required(ErrorMessage = "Please enter employee's date of marriage")]
        [Display(Name ="Marriage Date")]
        [DataType(DataType.Date,ErrorMessage = "Please specify the date in correct format MM/dd/yyyy")]
        public System.DateTime DateOfMarriage { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
