using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity.Infrastructure;
using System.Web.Http.ModelBinding;
using System.Web.Http.OData;
using System.Web.Http.OData.Query;
using System.Web.Http.OData.Routing;
using Microsoft.Data.OData;
using WebAPI.DataProvider.SystemManagement;
using WebAPI.DataProvider.EF;

namespace WebAPI.Controllers.OData
{
    [Authorize]
    public class AccountsController : ODataController
    {
        private AcccountDB db = new AcccountDB();

        // GET: odata/Accounts
        [EnableQuery]
        public IQueryable<SYS_Account> GetAccounts(ODataQueryOptions<SYS_Account> queryOptions)
        {
            return db.GetAll();
        }

        // GET: odata/Accounts(5)
        [EnableQuery]
        public SingleResult<SYS_Account> GetAccount([FromODataUri] string key, ODataQueryOptions<SYS_Account> queryOptions)
        {

            return SingleResult.Create(db.GetAll().Where(donVi => donVi.Username == key));
        }

        // PUT: odata/Accounts(5)
        public IHttpActionResult Put([FromODataUri] string key, SYS_Account delta)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            SYS_Account model = db.Get(key).First();
            if (model == null)
            {
                return NotFound();
            }
            delta.Username = model.Username;
            db.Update(delta);

            try
            {
                db.SaveToDb();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Exists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Updated(model);
        }

        // POST: odata/Accounts
        public IHttpActionResult Post(SYS_Account model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var addedEntity = this.db.Add(model);

            try
            {
                this.db.SaveToDb();
            }
            catch (DbUpdateException)
            {
                if (Exists(model.Username))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Created(model);
        }

        // PATCH: odata/Accounts(5)
        [AcceptVerbs("PATCH", "MERGE")]
        public IHttpActionResult Patch([FromODataUri] string key, Delta<SYS_Account> delta)
        {
            Validate(delta);

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            SYS_Account model = db.Get(key).First();
            if (model == null)
            {
                return NotFound();
            }

            delta.Patch(model);

            try
            {
                db.SaveToDb();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Exists(key))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(model);
        }

        // DELETE: odata/Accounts(5)
        public IHttpActionResult Delete([FromODataUri] string key)
        {
            try
            {
                db.Delete(key);
                db.SaveToDb();
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
            return Ok();
        }

        private bool Exists(string key)
        {
            return db.GetAll().Count(e => e.Username == key) > 0;
        }

        protected override void Dispose(bool disposing)
        {
            this.db.Dispose();
            base.Dispose(disposing);
        }
    }
}
