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
        Morada: <xsl:value-of select="ns:morada"/>
        <br></br>
        Telefone: <xsl:value-of select="ns:telefone"/>
        <br></br>
        <br></br>
    </xsl:template>
    
    <xsl:template match="ns:familia">
        <h3>Familiares:</h3>
        <xsl:apply-templates select="ns:familiar"/>
    </xsl:template>
    
    <xsl:template match="ns:familiar">
        Numero: <xsl:value-of select="ns:numero"/>
        <br></br>
        Relacao: <xsl:value-of select="ns:relacao"/>
    </xsl:template>
    
    <xsl:template match="ns:medicamentos">
        <h3>Medicamentos:</h3>
        <xsl:apply-templates select="ns:medicamento"/>
    </xsl:template>
    
    <xsl:template match="ns:medicamento">
        <h4>
            <xsl:value-of select="@name"/>
        </h4>
        Tempo de aviso: <xsl:value-of select="ns:tempoaviso"/> minutos
        <br></br>
        Hora de toma: <xsl:value-of select="ns:horatoma"/>
    </xsl:template>
    
    <xsl:template match="ns:alergias">
        <h3>Alergias:</h3>
        <xsl:if test="ns:comida">
            <h4>Comida:</h4>
            <xsl:for-each select="ns:comida">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ns:farmacos">
            <h4>Farmacos:</h4>
            <xsl:for-each select="ns:farmacos">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ns:doencas">
        <h3>Doencas:</h3>
        <xsl:for-each select="ns:doenca">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ns:apoios">
        <h1>Apoios:</h1>
        <xsl:apply-templates select="ns:refeicoes"/>
        <xsl:apply-templates select="//ns:apoios/ns:medicamentos"/>
        <xsl:apply-templates select="ns:transportes"/>
    </xsl:template>
    
    <xsl:template match="ns:refeicoes">
        <h2>Refeicoes:</h2>
        <h3>Pequeno(s) almoco(s):</h3>
        <xsl:for-each select="ns:pequenoalmoco">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
        <h3>Almoco(s):</h3>
        <xsl:for-each select="ns:almoco">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
        <h3>Lanche(s):</h3>
        <xsl:for-each select="ns:lanche">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
        <h3>Jantar(es):</h3>
        <xsl:for-each select="ns:jantar">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
        <br></br>
    </xsl:template>
    
    <xsl:template match="//ns:apoios/ns:medicamentos">
        <h2>Medicamentos:</h2>
        <xsl:for-each select="ns:medicamento">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ns:transportes">
        <h2>Transportes:</h2>
        <xsl:for-each select="ns:transporte">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
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
        <xsl:for-each select="ns:hora">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>