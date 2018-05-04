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
        [Required(ErrorMessage ="User Name must required")]
        [Display(Name="User Name")]
        [StringLength(maximumLength:60,MinimumLength =2, ErrorMessage ="User name must be in the range of 2 to 50 characters")]
        public string Name { get; set; }
        [Required(ErrorMessage ="Email must required")]
        [Display(Name="Email")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please Enter The Birth Date")]
        [Display(Name = "Birth Date")]
        [DataType(DataType.Date, ErrorMessage = "It's not a date, please see the format")]
        public System.DateTime DateOfBirth { get; set; }
        [Required(ErrorMessage = "Please Enter the Joining Date")]
        [Display(Name = "Joining Date")]
        [DataType(DataType.Date, ErrorMessage = "It's not a date, please see the format")]
        public System.DateTime DateOfJoining { get; set; }
        [Display(Name = "Email")]
        [DataType(DataType.Date, ErrorMessage = "It's not a date, please see the format")]
        public Nullable<System.DateTime> DateOfResignation { get; set; }

    }
}
