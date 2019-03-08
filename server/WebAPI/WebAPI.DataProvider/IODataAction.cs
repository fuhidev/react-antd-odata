using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAPI.DataProvider
{
    public interface IODataAction<M,T>
    {
        IQueryable<M> GetAll();
        IQueryable<M> Get(T id);
        M Update(M model);
        M Add(M model);
        void Delete(T id);
        void Dispose();
        void SaveToDb();
    }
}
