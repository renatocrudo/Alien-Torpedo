using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using AlienTorpedoAPI.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AlienTorpedoAPI.Controllers
{
    [Route("api/[controller]")]
    public class LoginController : Controller
    {

        private readonly dbAlienContext _dbcontext;

        public LoginController(dbAlienContext dbContext)
        {
            _dbcontext = dbContext;
        }

        // GET: api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public IActionResult AutenticarUsuario([FromBody]Usuario user)
        {
            try
            {
                int count = _dbcontext.Usuario.Where(u => u.NmEmail == user.NmEmail && u.NmSenha == user.NmSenha).Count();

                if (count > 0)
                {
                    return Json(new {NmEmail = user.NmEmail, mensagem = "OK"});
                }

                return Json(new { NmEmail = user.NmEmail, mensagem = "NOK" });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
