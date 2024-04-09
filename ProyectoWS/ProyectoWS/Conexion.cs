using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace ProyectoWS
{
    public class Conexion
    {
        public static MySqlConnection conexion()
        {
            string servidor = "localhost";
            string bd = "CiberkElectrik";
            string usuario = "root";
            string clave = "";
            String cadenaConexion = "Database=" + bd + "; Data Source=" + servidor + " ; User Id=" +
                usuario + " ; Password=" + clave + "";

            try
            {
                MySqlConnection conexionBD = new MySqlConnection(cadenaConexion);
                Console.WriteLine("Conexion Exitosa");
                return conexionBD;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return null;
            }

        }

    }
}