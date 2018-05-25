<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.dei.isep.ipp.pt/apoioidosos">

    <xsl:template match="/ns:apoioIdosos">
        <html>
            <head>
                <title>XML to HTML 1</title>
            </head>
            <body>
                <xsl:apply-templates select="ns:infoIdosos"/>
                <xsl:apply-templates select="ns:apoios"/>
                <xsl:apply-templates select="ns:calendario"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ns:infoIdosos">
        <h1>Informacao dos idosos:</h1>
        <xsl:for-each select="ns:idoso">
            <xsl:apply-templates select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ns:idoso">
        <h2>
            <xsl:value-of select="@name"/>
        </h2>
        <h3>Contactos:</h3>
        <xsl:apply-templates select="ns:contactos"/>
        <xsl:if test="ns:familia/ns:familiar">
            <xsl:apply-templates select="ns:familia"/>
        </xsl:if>
        <xsl:if test="ns:medicamentos">
            <xsl:apply-templates select="ns:medicamentos"/>
        </xsl:if>
        <xsl:if test="ns:alergias/ns:comida | ns:alergias/ns:farmacos">
            <xsl:apply-templates select="ns:alergias"/>
        </xsl:if>
        <xsl:if test="ns:doencas/ns:doenca">
            <xsl:apply-templates select="ns:doencas"/>
        </xsl:if>
        <br></br>
    </xsl:template>
    
    <xsl:template match="ns:contactos">
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Morada</th>
                    <th style="text-align:left">Telefone</th>
                </tr>
                <tr>
                    <td ><xsl:value-of select="ns:morada"/></td>
                    <td ><xsl:value-of select="ns:telefone"/></td>
                </tr>
        </table>
    </xsl:template>
    
    <xsl:template match="ns:familia">
        <h3>Familiares:</h3>
        <table border="1">
            <tr bgcolor="#9acd32">
                <th style="text-align:left">Familiar</th>
                <th style="text-align:left">Contacto</th>
            </tr>
            <xsl:for-each select="ns:familiar">
                <tr>
                    <td ><xsl:value-of select="ns:relacao"/></td>
                    <td><xsl:value-of select="ns:numero"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="ns:medicamentos">
        <h3>Medicamentos:</h3>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Medicamento</th>
                    <th style="text-align:left">Tempo de Aviso</th>
                    <th style="text-align:left">Hora de toma</th>
                </tr>
                <xsl:for-each select="ns:medicamento">
                    <tr>
                        <td ><xsl:value-of select="@name"/></td>
                        <td ><xsl:value-of select="ns:tempoaviso"/></td>
                        <td ><xsl:value-of select="ns:horatoma"/></td>
                        
                    </tr>
                </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="ns:alergias">
        <h3>Alergias:</h3>
        <xsl:if test="ns:comida">
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Comida</th>
                </tr>
                <xsl:for-each select="ns:comida">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br></br>
            <br></br>
        </xsl:if>
        <xsl:if test="ns:farmacos">
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Farmacos</th>
                </tr>
                <xsl:for-each select="ns:farmacos">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
            </table>
            <br></br>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ns:doencas">
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Doenças</th>
                </tr>
                <xsl:for-each select="ns:doenca">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
            </table>
    </xsl:template>
    
    <xsl:template match="ns:apoios">
        <h1>Apoios:</h1>
        <xsl:apply-templates select="ns:refeicoes"/>
        <xsl:apply-templates select="//ns:apoios/ns:medicamentos"/>
        <xsl:apply-templates select="ns:transportes"/>
    </xsl:template>
    
    <xsl:template match="ns:refeicoes">
        <h2>Refeicoes:</h2>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Pequeno(s) almoco(s)</th>
                </tr>
                <xsl:for-each select="ns:pequenoalmoco">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
        <br></br>
        <br></br>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Almoço(s)</th>
                </tr>
                <xsl:for-each select="ns:almoco">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
        <br></br>
        <br></br>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Lanches (s)</th>
                </tr>
                <xsl:for-each select="ns:lanche">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
        <br></br>
        <br></br>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Jantares (s)</th>
                </tr>
                <xsl:for-each select="ns:jantar">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
        <br></br>
    </xsl:template>
    
    <xsl:template match="//ns:apoios/ns:medicamentos">
        <h2>Medicamentos:</h2>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Medicamento</th>
                </tr>
                <xsl:for-each select="ns:medicamento">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="ns:transportes">
        <h2>Transportes:</h2>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Transporte</th>
                </tr>
                <xsl:for-each select="ns:transporte">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
    </xsl:template>
    
<!--    <xsl:template match="ns:transporte">
        <h5>
            <xsl:value-of select="@name"/>
        </h5>
        <xsl:for-each select="ns:hora">
            Hora: <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>-->
    
    <xsl:template match="ns:calendario">
        <h1>Calendario de transportes:</h1>
            <xsl:apply-templates select="ns:transporte"/>
        <br></br>
    </xsl:template>
    
    <xsl:template match="ns:transporte">
        <h2>
            <xsl:value-of select="@name"/>
        </h2>
        <table border="1">
                <tr bgcolor="#9acd32">
                    <th style="text-align:left">Horas</th>
                </tr>
                <xsl:for-each select="ns:hora">
                    <tr>
                        <td ><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>