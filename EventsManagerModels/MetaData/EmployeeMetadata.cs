using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventsManagerModels.MetaData
{
    class EmployeeMetadata
    {
        [Required(ErrorMessage = "Colleague name is required")]
        [Display(Name="Colleague Name")]
        [StringLength(maximumLength:100,MinimumLength =2, ErrorMessage ="Colleague name must be in the range of 2-100 characters")]
        public string Name { get; set; }
        [Required(ErrorMessage ="Email is required")]
        [Display(Name="Email")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please enter the date of birth")]
        [Display(Name = "Birth Date")]
        [DataType(DataType.Date, ErrorMessage = "Please specify the date in correct format MM/dd/yyyy")]
        public System.DateTime DateOfBirth { get; set; }
        [Required(ErrorMessage = "Please enter the date of joining")]
        [Display(Name = "Joining Date")]
        [DataType(DataType.Date, ErrorMessage = "Please specify the date in correct format MM/dd/yyyy")]
        public System.DateTime DateOfJoining { get; set; }
        [Display(Name = "Resignation Date")]
        [DataType(DataType.Date, ErrorMessage = "Please specify the date in correct format MM/dd/yyyy")]
        public Nullable<System.DateTime> DateOfResignation { get; set; }

    }
}
