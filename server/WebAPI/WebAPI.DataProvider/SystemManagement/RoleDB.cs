using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAPI.DataProvider.EF;

/**
 * Author: PhuongHieuHo
**/

namespace WebAPI.DataProvider.SystemManagement
{
    public class RoleDB : IODataAction<SYS_Role, string>
    {
        private SystemEntities context = new SystemEntities();
        public SYS_Role Add(SYS_Role model)
        {
            context.SYS_Role.Add(model);
            return model;
        }

        public void Delete(string id)
        {
            var model = context.SYS_Role.FirstOrDefault(f => f.ID.Equals(id));
            if (model == null) return;
            context.SYS_Role.Remove(model);
        }

        public void Dispose()
        {
            context.Dispose();
        }

        public IQueryable<SYS_Role> Get(string id)
        {
            return context.SYS_Role.Where(w => w.ID.Equals(id)).AsQueryable();
        }

        public IQueryable<SYS_Role> GetAll()
        {
            return context.SYS_Role.AsQueryable();
        }

        public void SaveToDb()
        {
            context.SaveChanges();
        }

        public SYS_Role Update(SYS_Role model)
        {
            var baseModel = context.SYS_Role.FirstOrDefault(f => f.ID.Equals(model.ID));

            if (baseModel == null) return null;

            context.SYS_Role.AddOrUpdate(model);
            return model;
        }
    }
}
