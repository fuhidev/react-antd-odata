using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using System.Web.Http.OData;
using System.Web.Http.OData.Query;
using System.Web.Http.OData.Routing;
using WebAPI.DataProvider.EF;
using Microsoft.Data.OData;
using WebAPI.DataProvider.SystemManagement;
using System.Data.Entity.Infrastructure;

namespace WebAPI.Controllers.OData
{
    public class RolesController : ODataController
    {
        private RoleDB db = new RoleDB();

        // GET: odata/Roles
        [EnableQuery] // cho phép sử dụng $filter $select.........
        public IQueryable<SYS_Role> GetRoles(ODataQueryOptions<SYS_Role> queryOptions)
        {
            return db.GetAll();
        }

        // GET: odata/Roles(5)
        [EnableQuery]
        public SingleResult<SYS_Role> GetSYS_Role([FromODataUri] string key, ODataQueryOptions<SYS_Role> queryOptions)
        {
            return SingleResult.Create(db.Get(key));
        }

        // PUT: odata/Roles(5)
        public IHttpActionResult Put([FromODataUri] string key, Delta<SYS_Role> delta)
        {
            Validate(delta.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // TODO: Get the entity here.

            // delta.Put(sYS_Role);

            // TODO: Save the patched entity.

            // return Updated(sYS_Role);
            return StatusCode(HttpStatusCode.NotImplemented);
        }

        // POST: odata/Roles
        public IHttpActionResult Post(SYS_Role model)
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
                if (Exists(model.ID))
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

        // PATCH: odata/Roles(5)
        [AcceptVerbs("PATCH", "MERGE")]
        public IHttpActionResult Patch([FromODataUri] string key, Delta<SYS_Role> delta)
        {
            Validate(delta.GetEntity());

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // TODO: Get the entity here.

            // delta.Patch(sYS_Role);

            // TODO: Save the patched entity.

            // return Updated(sYS_Role);
            return StatusCode(HttpStatusCode.NotImplemented);
        }

        // DELETE: odata/Roles(5)
        public IHttpActionResult Delete([FromODataUri] string key)
        {
            db.Delete(key);
            try
            {
                db.SaveToDb();
                return Ok();
            }
            catch (Exception)
            {
                return NotFound();
            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        private bool Exists(string key)
        {
            return db.GetAll().Count(e => e.ID == key) > 0;
        }
    }
}
