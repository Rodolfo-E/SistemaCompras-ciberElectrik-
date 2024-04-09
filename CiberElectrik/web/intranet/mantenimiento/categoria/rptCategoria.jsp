<%@page import="CiberElectrik.util.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //Conexion a la BD
    Conexion objconexion = new Conexion();
    Connection xcon = objconexion.Conectar();
    //estamos buscando la ruta del reporte
    File reportFile = new File(application.getRealPath("/intranet/reportes/rptCategoria.jasper"));
    //parametros
    Map parameters = new HashMap();
    parameters.put("Nombre_parametro", "Valor_Parametro");
    //arreglo de byte crear el reporte
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, xcon);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream outputStream = response.getOutputStream();
    outputStream.write(bytes, 0, bytes.length);
    outputStream.flush();
    outputStream.close();
%>