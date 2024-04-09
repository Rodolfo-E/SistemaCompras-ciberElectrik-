using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using MySql.Data.MySqlClient;
namespace ProyectoWS
{
    /// <summary>
    /// Descripción breve de Reniec
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Reniec : System.Web.Services.WebService
    {

        [WebMethod]
        public string BuscarCiudadano(string dni)
        {
            try
            {



                string sql = "Select nombre,apellido,direccion,fecha,correo,telefono,celular,d.coddis,d.nomdis " +
                    "from t_ciudadano c inner join t_distrito d on c.coddis=d.coddis where dni =" + dni + "";
                MySqlConnection conexionBD = Conexion.conexion();
                conexionBD.Open();

                MySqlDataAdapter comando = new MySqlDataAdapter(sql, conexionBD);


                DataSet ds = new DataSet();
                comando.Fill(ds);



                DataTable tabla = ds.Tables[0];

                    
                string nom = tabla.Rows[0]["nombre"].ToString();
                string ape = tabla.Rows[0]["apellido"].ToString();
                string dir = tabla.Rows[0]["direccion"].ToString();
                string fec = tabla.Rows[0]["fecha"].ToString();
                string cor = tabla.Rows[0]["correo"].ToString();
                string tel = tabla.Rows[0]["telefono"].ToString();
                string cel = tabla.Rows[0]["celular"].ToString();
                string codd = tabla.Rows[0]["coddis"].ToString();
                string dis = tabla.Rows[0]["nomdis"].ToString();


                return nom + ",  " + ape +", " +dir+ ", "+ fec + ", "+ cor +", "+tel+", "+cel+", "+ codd+", " +dis;

            }
            catch (Exception ex)
            {
                //  MessageBox.Show("Error al Buscar" + ex. Message);
                return "";
            }

            //  return nom+" - "+dir;
       }
    
    }
}
