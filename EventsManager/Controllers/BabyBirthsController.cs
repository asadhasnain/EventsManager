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
    public class BabyBirthsController : Controller
    {
        private DomainModels db = new DomainModels();

        // GET: BabyBirths
        public ActionResult Index()
        {
            var babyBirths = db.BabyBirths.Include(b => b.Employee);
            return View(babyBirths.ToList());
        }

        // GET: BabyBirths/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BabyBirth babyBirth = db.BabyBirths.Find(id);
            if (babyBirth == null)
            {
                return HttpNotFound();
            }
            return View(babyBirth);
        }

        // GET: BabyBirths/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: BabyBirths/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Gender,DateOfBirth,EmployeeID")] BabyBirth babyBirth)
        {
            if (ModelState.IsValid)
            {
                db.BabyBirths.Add(babyBirth);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", babyBirth.EmployeeID);
            return View(babyBirth);
        }

        // GET: BabyBirths/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BabyBirth babyBirth = db.BabyBirths.Find(id);
            if (babyBirth == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", babyBirth.EmployeeID);
            return View(babyBirth);
        }

        // POST: BabyBirths/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Gender,DateOfBirth,EmployeeID")] BabyBirth babyBirth)
        {
            if (ModelState.IsValid)
            {
                db.Entry(babyBirth).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", babyBirth.EmployeeID);
            return View(babyBirth);
        }

        // GET: BabyBirths/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BabyBirth babyBirth = db.BabyBirths.Find(id);
            if (babyBirth == null)
            {
                return HttpNotFound();
            }
            return View(babyBirth);
        }

        // POST: BabyBirths/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BabyBirth babyBirth = db.BabyBirths.Find(id);
            db.BabyBirths.Remove(babyBirth);
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
