<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.dei.isep.ipp.pt/apoioidosos">

    <xsl:template match="/ns:apoioIdosos">
        <html>
            <head>
                <title>XML to HTML</title>
            </head>
            <body>
                aaaaa
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
        <hr></hr>
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
        <hr></hr>
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
        <hr></hr>
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
        <h3>Apoios:</h3>
        <xsl:if test="ns:refeicoes">
            <xsl:apply-templates select="ns:refeicoes"/>
        </xsl:if>
        <xsl:if test="ns:medicamentos/ns:medicamento">
            <xsl:apply-templates select="ns:medicamentos"/>
        </xsl:if>
        <xsl:if test="transportes/transporte">
            <xsl:apply-templates select="transportes"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ns:refeicoes">
        <h4>Refeicoes:</h4>
        <xsl:if test="ns:pequenoalmoco">
            <h5>Pequeno(s) almoco(s):</h5>
            <xsl:for-each select="ns:pequenoalmoco">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ns:almoco">
            <h5>Almoco(s):</h5>
            <xsl:for-each select="ns:almoco">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ns:lanche">
            <h5>Lanche(s):</h5>
            <xsl:for-each select="ns:lanche">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ns:jantar">
            <h5>Jantar(es):</h5>
            <xsl:for-each select="ns:jantar">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <br></br>
    </xsl:template>
    
    
    <xsl:template match="ns:transportes">
        <h4>Transportes:</h4>
        <xsl:apply-templates select="ns:transporte"/>
    </xsl:template>
    
    <xsl:template match="ns:transporte">
        <h5>
            <xsl:value-of select="@name"/>
        </h5>
        <xsl:for-each select="ns:hora">
            Hora: <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ns:calendario">
        <h3>Calendario:</h3>
        <xsl:if test="ns:horapequenoalmoco">
            Hora pequeno almoco:<xsl:value-of select="ns:horapequenoalmoco"/>
            <br></br>
        </xsl:if>
        <xsl:if test="ns:horaalmoco">
            Hora almoco:<xsl:value-of select="ns:horaalmoco"/>
            <br></br>
        </xsl:if>
        <xsl:if test="ns:horalanche">
            Hora lanche:<xsl:value-of select="ns:horalanche"/>
            <br></br>
        </xsl:if>
        <xsl:if test="ns:horajantar">
            Hora jantar:<xsl:value-of select="ns:horajantar"/>
            <br></br>
        </xsl:if>
        <br></br>
    </xsl:template>
</xsl:stylesheet>