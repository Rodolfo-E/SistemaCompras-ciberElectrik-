
package org.tempuri;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="BuscarCiudadanoResult" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "buscarCiudadanoResult"
})
@XmlRootElement(name = "BuscarCiudadanoResponse")
public class BuscarCiudadanoResponse {

    @XmlElement(name = "BuscarCiudadanoResult")
    protected String buscarCiudadanoResult;

    /**
     * Obtiene el valor de la propiedad buscarCiudadanoResult.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBuscarCiudadanoResult() {
        return buscarCiudadanoResult;
    }

    /**
     * Define el valor de la propiedad buscarCiudadanoResult.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBuscarCiudadanoResult(String value) {
        this.buscarCiudadanoResult = value;
    }

}
