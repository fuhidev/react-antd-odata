using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAPI.DataProvider.EF;
using System.Data.Entity.Migrations;

/**
 * Author: PhuongHieuHo
**/

namespace WebAPI.DataProvider.SystemManagement
{
    public class AcccountDB : IODataAction<SYS_Account, string>
    {
        private SystemEntities context = new SystemEntities();
        public SYS_Account Add(SYS_Account model)
        {
            context.SYS_Account.Add(model);
            return model;
        }

        public void Delete(string id)
        {
            var model = context.SYS_Account.FirstOrDefault(f => f.Username.Equals(id));
            context.SYS_Account.Remove(model);
        }

        public void Dispose()
        {
            context.Dispose();
        }

        public IQueryable<SYS_Account> Get(string id)
        {
            return context.SYS_Account.Where(s => s.Username.Equals(id)).AsQueryable();
        }

        public IQueryable<SYS_Account> GetAll()
        {
            return context.SYS_Account.AsQueryable();
        }

        public void SaveToDb()
        {
            context.SaveChanges();
        }

        public SYS_Account Update(SYS_Account model)
        {
            var baseModel = context.SYS_Account.FirstOrDefault(f => f.Username.Equals(model.Username));

            if (baseModel == null) return null;

            context.SYS_Account.AddOrUpdate(model);
            return model;
        }
    }
}
