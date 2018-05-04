using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EventsManagerModels;

namespace EventsManager.Controllers
{
    public class RegistrationsController : Controller
    {
        private DomainModels db = new DomainModels();

        // GET: Registrations
        public ActionResult Index()
        {
            var registrations = db.Registrations.Include(r => r.Employee).Include(r => r.Event);
            return View(registrations.ToList());
        }

        // GET: Registrations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // GET: Registrations/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name");
            ViewBag.EventID = new SelectList(db.Events, "Id", "Title");
            return View();
        }

        // POST: Registrations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NumberOfGuests,Paid,EmployeeID,EventID")] Registration registration)
        {
            if (ModelState.IsValid)
            {
                db.Registrations.Add(registration);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", registration.EmployeeID);
            ViewBag.EventID = new SelectList(db.Events, "Id", "Title", registration.EventID);
            return View(registration);
        }

        // GET: Registrations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", registration.EmployeeID);
            ViewBag.EventID = new SelectList(db.Events, "Id", "Title", registration.EventID);
            return View(registration);
        }

        // POST: Registrations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NumberOfGuests,Paid,EmployeeID,EventID")] Registration registration)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registration).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", registration.EmployeeID);
            ViewBag.EventID = new SelectList(db.Events, "Id", "Title", registration.EventID);
            return View(registration);
        }

        // GET: Registrations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Registration registration = db.Registrations.Find(id);
            if (registration == null)
            {
                return HttpNotFound();
            }
            return View(registration);
        }

        // POST: Registrations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Registration registration = db.Registrations.Find(id);
            db.Registrations.Remove(registration);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

		// GET: Registrations/Register/5
		public ActionResult Register(int? id, int? EventId)
			{
			int? EmployeeId = id;
			if (EventId == null || EmployeeId == null)
				{
				return new HttpStatusCodeResult (HttpStatusCode.BadRequest);
				}

			Registration registration = db.Registrations.Where (e => e.EventID == EventId).Where (em => em.EmployeeID == EmployeeId).FirstOrDefault ();
			if (registration == null)
				{
				ViewBag.SubmitValue = "Register";
				registration = new Registration ();
				registration.Employee = db.Employees.Where (e => e.Id == EmployeeId).FirstOrDefault ();
				if (registration.Employee == null)
					{
					return new HttpNotFoundResult ();
					}
				registration.EmployeeID = registration.Employee.Id;
				}
			else
				{
				ViewBag.SubmitValue = "Update";
				}
				//registration.Event = db.Events.Where (e => e.Id == (db.Schedules.Where(s => s.EndDate > DateTime.Now).Select(s => s.Id).Where(i => i == id)).FirstOrDefault()).FirstOrDefault ();
				registration.Event = db.Schedules.Where (s => s.StartDate <= DateTime.Now && s.EndDate > DateTime.Now).Select (s => s.Event).Where (e => e.Id == EventId).FirstOrDefault ();
				if (registration.Event == null)
					{
					Event @event = db.Events.Find (EventId);
					if (@event != null)
						{
						// Show the registration ended page
						return Content("Sorry! Registration Period is not active for the event \""+@event.Title+"\"");
						}
					else
						return new HttpNotFoundResult ();
					}

			registration.EventID = registration.Event.Id;

			ViewBag.EmployeeID = new SelectList (db.Employees, "Id", "Name", registration.EmployeeID);
			ViewBag.EventID = new SelectList (db.Events, "Id", "Title", registration.EventID);
			return View (registration);
			}

		// POST: Registrations/Register/5
		// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Register([Bind (Include = "Id,NumberOfGuests,Paid,EmployeeID,EventID")] Registration registration,string register)
			{
			if (ModelState.IsValid)
				{
				if (register.Equals ("Register"))
					{
					db.Registrations.Add (registration);
					}
				else
					{
					registration.Id = db.Registrations.Where (r => r.EmployeeID == registration.EmployeeID && r.EventID == registration.EventID).Select (r => r.Id).FirstOrDefault ();
					db.Entry (registration).State = EntityState.Modified;
					}		
				db.SaveChanges ();
				if (register.Equals ("Register"))
					return Content ("You have been registered for the event \"" + db.Events.Find (registration.EventID).Title + "\"");
				else
					return Content ("Your Registration Information has been updated the for the event \"" + db.Events.Find (registration.EventID).Title + "\"");
				}
			ViewBag.EmployeeID = new SelectList (db.Employees, "Id", "Name", registration.EmployeeID);
			ViewBag.EventID = new SelectList (db.Events, "Id", "Title", registration.EventID);
			return View (registration);
			}

		// GET: Registrations/Delete/5
		public ActionResult Unregister(int? id)
			{
			if (id == null)
				{
				return new HttpStatusCodeResult (HttpStatusCode.BadRequest);
				}
			Registration registration = db.Registrations.Find (id);
			if (registration == null)
				{
				return HttpNotFound ();
				}
			return View (registration);
			}

		// POST: Registrations/Delete/5
		[HttpPost, ActionName ("Unregister")]
		[ValidateAntiForgeryToken]
		public ActionResult UnregisterConfirmed(int id)
			{
			Registration registration = db.Registrations.Find (id);
			db.Registrations.Remove (registration);
			db.SaveChanges ();
			return Content("Unregistered Successfully");
			}
		}
}
