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
    public class FounderAwardsController : Controller
    {
        private DomainModels db = new DomainModels();

        // GET: FounderAwards
        public ActionResult Index()
        {
            var founderAwards = db.FounderAwards.Include(f => f.Employee);
            return View(founderAwards.ToList());
        }

        // GET: FounderAwards/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FounderAward founderAward = db.FounderAwards.Find(id);
            if (founderAward == null)
            {
                return HttpNotFound();
            }
            return View(founderAward);
        }

        // GET: FounderAwards/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: FounderAwards/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,EmployeeId,Date")] FounderAward founderAward)
        {
            if (ModelState.IsValid)
            {
                db.FounderAwards.Add(founderAward);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "Name", founderAward.EmployeeId);
            return View(founderAward);
        }

        // GET: FounderAwards/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FounderAward founderAward = db.FounderAwards.Find(id);
            if (founderAward == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "Name", founderAward.EmployeeId);
            return View(founderAward);
        }

        // POST: FounderAwards/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,EmployeeId,Date")] FounderAward founderAward)
        {
            if (ModelState.IsValid)
            {
                db.Entry(founderAward).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "Name", founderAward.EmployeeId);
            return View(founderAward);
        }

        // GET: FounderAwards/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FounderAward founderAward = db.FounderAwards.Find(id);
            if (founderAward == null)
            {
                return HttpNotFound();
            }
            return View(founderAward);
        }

        // POST: FounderAwards/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FounderAward founderAward = db.FounderAwards.Find(id);
            db.FounderAwards.Remove(founderAward);
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
    }
}
