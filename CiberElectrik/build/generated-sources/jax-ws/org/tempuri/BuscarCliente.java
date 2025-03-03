
package org.tempuri;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "BuscarCliente", targetNamespace = "http://tempuri.org/", wsdlLocation = "http://localhost:49199/BuscarCliente.asmx?wsdl")
public class BuscarCliente
    extends Service
{

    private final static URL BUSCARCLIENTE_WSDL_LOCATION;
    private final static WebServiceException BUSCARCLIENTE_EXCEPTION;
    private final static QName BUSCARCLIENTE_QNAME = new QName("http://tempuri.org/", "BuscarCliente");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:49199/BuscarCliente.asmx?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        BUSCARCLIENTE_WSDL_LOCATION = url;
        BUSCARCLIENTE_EXCEPTION = e;
    }

    public BuscarCliente() {
        super(__getWsdlLocation(), BUSCARCLIENTE_QNAME);
    }

    public BuscarCliente(WebServiceFeature... features) {
        super(__getWsdlLocation(), BUSCARCLIENTE_QNAME, features);
    }

    public BuscarCliente(URL wsdlLocation) {
        super(wsdlLocation, BUSCARCLIENTE_QNAME);
    }

    public BuscarCliente(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, BUSCARCLIENTE_QNAME, features);
    }

    public BuscarCliente(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public BuscarCliente(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns BuscarClienteSoap
     */
    @WebEndpoint(name = "BuscarClienteSoap")
    public BuscarClienteSoap getBuscarClienteSoap() {
        return super.getPort(new QName("http://tempuri.org/", "BuscarClienteSoap"), BuscarClienteSoap.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns BuscarClienteSoap
     */
    @WebEndpoint(name = "BuscarClienteSoap")
    public BuscarClienteSoap getBuscarClienteSoap(WebServiceFeature... features) {
        return super.getPort(new QName("http://tempuri.org/", "BuscarClienteSoap"), BuscarClienteSoap.class, features);
    }

    /**
     * 
     * @return
     *     returns BuscarClienteSoap
     */
    @WebEndpoint(name = "BuscarClienteSoap12")
    public BuscarClienteSoap getBuscarClienteSoap12() {
        return super.getPort(new QName("http://tempuri.org/", "BuscarClienteSoap12"), BuscarClienteSoap.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns BuscarClienteSoap
     */
    @WebEndpoint(name = "BuscarClienteSoap12")
    public BuscarClienteSoap getBuscarClienteSoap12(WebServiceFeature... features) {
        return super.getPort(new QName("http://tempuri.org/", "BuscarClienteSoap12"), BuscarClienteSoap.class, features);
    }

    private static URL __getWsdlLocation() {
        if (BUSCARCLIENTE_EXCEPTION!= null) {
            throw BUSCARCLIENTE_EXCEPTION;
        }
        return BUSCARCLIENTE_WSDL_LOCATION;
    }

}
