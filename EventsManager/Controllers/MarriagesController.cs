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
    public class MarriagesController : Controller
    {
        private DomainModels db = new DomainModels();

        // GET: Marriages
        public ActionResult Index()
        {
            var marriages = db.Marriages.Include(m => m.Employee);
            return View(marriages.ToList());
        }

        // GET: Marriages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Marriage marriage = db.Marriages.Find(id);
            if (marriage == null)
            {
                return HttpNotFound();
            }
            return View(marriage);
        }

        // GET: Marriages/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name");
            return View();
        }

        // POST: Marriages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,EmployeeID,DateOfMarriage")] Marriage marriage)
        {
            if (ModelState.IsValid)
            {
                db.Marriages.Add(marriage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", marriage.EmployeeID);
            return View(marriage);
        }

        // GET: Marriages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Marriage marriage = db.Marriages.Find(id);
            if (marriage == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", marriage.EmployeeID);
            return View(marriage);
        }

        // POST: Marriages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,EmployeeID,DateOfMarriage")] Marriage marriage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(marriage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "Id", "Name", marriage.EmployeeID);
            return View(marriage);
        }

        // GET: Marriages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Marriage marriage = db.Marriages.Find(id);
            if (marriage == null)
            {
                return HttpNotFound();
            }
            return View(marriage);
        }

        // POST: Marriages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Marriage marriage = db.Marriages.Find(id);
            db.Marriages.Remove(marriage);
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
