using EventsManagerModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;

namespace EventsManager.CustomClasses
	{
	public class EmailHandler
		{
		static string password = WebConfigurationManager.AppSettings["MyPassword"];
		static bool mailSent = false;
		private static void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
			{
			// Get the unique identifier for this asynchronous operation.
			String token = (string)e.UserState;

			if (e.Cancelled)
				{
				Debug.WriteLine ("[{0}] Send canceled.", token);
				}
			if (e.Error != null)
				{
				Debug.WriteLine ("[{0}] {1}", token, e.Error.ToString ());
				}
			else
				{
				Debug.WriteLine ("Message sent.");
				}
			mailSent = true;
			}

		public static void GenerateEmails(int scheduleId,string url)
			{
			Thread emailThread = new Thread (delegate ()
				{
					SendEmail (scheduleId,url);
					});
			emailThread.Start ();
			}
		public static void SendEmail(int scheduleId, string url)
			{
			DomainModels db = new DomainModels ();
			Schedule schedule = db.Schedules.Find (scheduleId);
			string eventTitle = schedule.Event.Title;
			string eventDate = schedule.Event.Schedule.ToLongDateString ();
			string eventTime = schedule.Event.Schedule.ToShortTimeString ();
			string contribution = schedule.Contribution != null ? "Rs. " + schedule.Contribution : "";
			string guestAllowed = schedule.AllowGuest ? "Yes" : "No";
			string guestContribution = schedule.GuestContribution != null ? "Rs. " + schedule.GuestContribution : "";
			string registrationStart = schedule.StartDate.ToShortTimeString() + " " + schedule.StartDate.ToLongDateString();
			string registrationEnd = schedule.EndDate.ToShortTimeString () + " " + schedule.EndDate.ToLongDateString ();
			;

			string eventInfo = String.Format ("Event Title {0,19} {1,40}"  +
								"\nTime {0,26} {2,40}"  +
								"\nDate {0,26} {3,40}"  +
								"\nRegistration Start Time {0,7} {4,40}"  +
								"\nRegistration End Time {0,9} {5,40}" , 
								"--",
								eventTitle, eventTime, eventDate, registrationStart, registrationEnd);

			eventInfo = contribution != "" ? eventInfo +
								String.Format("\nContribution {0,18} {1,40}","--" , contribution) : eventInfo;

			eventInfo = guestAllowed == "Yes" ? eventInfo +
								string.Format("\nGuest Allowed {0,17} {1,40}" +
								"\nGuest Contribution {0,12} {2,40}" ,"--","Yes", guestContribution) : 
								eventInfo + String.Format("\nGuest Allowed {0,17} {1,40}","--","No");

			SmtpClient smtpClient = new SmtpClient ();
			smtpClient.Port = 587;
			smtpClient.Host = "smtp.live.com";
			smtpClient.EnableSsl = true;
			smtpClient.UseDefaultCredentials = false;
			smtpClient.Credentials = new NetworkCredential ("bilal.farooq@bentley.com", password);

			MailAddress from = new MailAddress ("bilal.farooq@bentley.com", "Bilal Farooq", System.Text.Encoding.UTF8);
			MailAddress to = new MailAddress ("be2bd648.bentley.onmicrosoft.com@amer.teams.ms");
			MailMessage message = new MailMessage (from, to);

			foreach (Employee employee in db.Employees)
				{
				to = new MailAddress (employee.Email);

				message = new MailMessage (from, to);
				//message.To.Add(new MailAddress("asad.bukhari@bentley.com"));
				//message.To.Add(new MailAddress("Aliraza.Ahmed@bentley.com"));
				//message.To.Add(new MailAddress("irshad.babar@bentley.com"));
				//message.To.Add(new MailAddress("Bilal.Farooq@bentley.com"));
				//message.To.Add (new MailAddress ("be2bd648.bentley.onmicrosoft.com@amer.teams.ms"));
				//message.To.Add (new MailAddress (""));

				message.Body = "Hi " + employee.Name + "\n\n"
								+ eventInfo + "\n\n" +
								"You can register for this event by visiting the following link any time during the registration period.\n" +
								url + "\\Registrations\\Register\\" + employee.Id + "\\" + schedule.EventID +
								"\n\n Regards,\n" + schedule.Event.Committee.Title +" Committee";

				//string someArrows = new string(new char[] { '\u2190', '\u2191', '\u2192', '\u2193' });
				//message.Body += Environment.NewLine + someArrows;
				message.BodyEncoding = System.Text.Encoding.UTF8;
				message.Subject = "Event Notification";
				message.SubjectEncoding = System.Text.Encoding.UTF8;

				smtpClient.SendCompleted += new
				SendCompletedEventHandler (SendCompletedCallback);
				
				smtpClient.Send(message);
				}

			//string answer = Debug.ReadLine();

			//if (answer.StartsWith("c") && mailSent == false)
			//{
			//    smtpClient.SendAsyncCancel();
			//}

			// Clean up.
			//message.Dispose();
			Debug.WriteLine ("Goodbye.");
			//Debug.ReadKey();

			}
		}
	}