﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventsManagerModels
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DomainModels : DbContext
    {
        public DomainModels()
            : base("name=BeEventsConnectionString")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Budget> Budgets { get; set; }
        public virtual DbSet<Committee> Committees { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Event> Events { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<FounderAward> FounderAwards { get; set; }
        public virtual DbSet<BabyBirth> BabyBirths { get; set; }
        public virtual DbSet<Expense> Expenses { get; set; }
        public virtual DbSet<Lunch> Lunches { get; set; }
        public virtual DbSet<Marriage> Marriages { get; set; }
        public virtual DbSet<Registration> Registrations { get; set; }
        public virtual DbSet<Schedule> Schedules { get; set; }
    }
}
