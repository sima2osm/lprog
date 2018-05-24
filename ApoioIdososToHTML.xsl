<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    
    <xsl:template match="/infoIdosos">
        <html>
            <head>
                <title>XML to HTML</title>
            </head>
            <body>
                <xsl:apply-templates select="idoso"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="idoso">
        <h1>
            <xsl:value-of select="@name"/>
        </h1>
        <h2>Contactos:</h2>
        <xsl:apply-templates select="contactos"/>
        <xsl:if test="familia/familiar">
            <xsl:apply-templates select="familia"/>
        </xsl:if>
        <xsl:apply-templates select="apoios"/>
        <xsl:if test="calendario">
            <xsl:apply-templates select="calendario"/>
        </xsl:if>
        <xsl:if test="alergias/comida | alergias/farmacos">
            <xsl:apply-templates select="alergias"/>
        </xsl:if>
        <xsl:if test="doencas/doenca">
            <xsl:apply-templates select="doencas"/>
        </xsl:if>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
    </xsl:template>
    
    <xsl:template match="contactos">
        Morada: <xsl:value-of select="morada"/>
        <br></br>
        Telefone: <xsl:value-of select="telefone"/>
        <br></br>
        <br></br>
    </xsl:template>
    
    <xsl:template match="familia">
        <h2>Familiares:</h2>
        <xsl:apply-templates select="familiar"/>
    </xsl:template>
    
    <xsl:template match="familiar">
        Numero: <xsl:value-of select="numero"/>
        <br></br>
        Relacao: <xsl:value-of select="relacao"/>
        <br></br>
        <br></br>
    </xsl:template>
    
    <xsl:template match="apoios">
        <h2>Apoios:</h2>
        <xsl:if test="refeicoes">
            <xsl:apply-templates select="refeicoes"/>
        </xsl:if>
        <xsl:if test="medicamentos/medicamento">
            <xsl:apply-templates select="medicamentos"/>
        </xsl:if>
        <xsl:if test="transportes/transporte">
            <xsl:apply-templates select="transportes"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="refeicoes">
        <h3>Refeicoes:</h3>
        <xsl:if test="pequenoalmoco">
            <h4>Pequeno(s) almoco(s):</h4>
            <xsl:for-each select="pequenoalmoco">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="almoco">
            <h4>Almoco(s):</h4>
            <xsl:for-each select="almoco">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="lanche">
            <h4>Lanche(s):</h4>
            <xsl:for-each select="lanche">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="jantar">
            <h4>Jantar(es):</h4>
            <xsl:for-each select="jantar">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <br></br>
    </xsl:template>
    
    <xsl:template match="medicamentos">
        <h3>Medicamentos:</h3>
        <xsl:apply-templates select="medicamento"/>
    </xsl:template>
    
    <xsl:template match="medicamento">
        <h4>
            <xsl:value-of select="@name"/>
        </h4>
        Tempo de aviso: <xsl:value-of select="tempoaviso"/> minutos
        <br></br>
        Hora de toma: <xsl:value-of select="horatoma"/>
        <br></br>
    </xsl:template>
    
    <xsl:template match="transportes">
        <h3>Transportes:</h3>
        <xsl:apply-templates select="transporte"/>
    </xsl:template>
    
    <xsl:template match="transporte">
        <h4>
            <xsl:value-of select="@name"/>
        </h4>
        <xsl:for-each select="hora">
            Hora: <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="calendario">
        <h2>Calendario:</h2>
        <xsl:if test="horapequenoalmoco">
            Hora pequeno almoco:<xsl:value-of select="horapequenoalmoco"/>
            <br></br>
        </xsl:if>
        <xsl:if test="horaalmoco">
            Hora almoco:<xsl:value-of select="horaalmoco"/>
            <br></br>
        </xsl:if>
        <xsl:if test="horalanche">
            Hora lanche:<xsl:value-of select="horalanche"/>
            <br></br>
        </xsl:if>
        <xsl:if test="horajantar">
            Hora jantar:<xsl:value-of select="horajantar"/>
            <br></br>
        </xsl:if>
        <br></br>
    </xsl:template>
    
    <xsl:template match="alergias">
        <h2>Alergias:</h2>
        <xsl:if test="comida">
            <h3>Comida:</h3>
            <xsl:for-each select="comida">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="farmacos">
            <h3>Farmacos:</h3>
            <xsl:for-each select="farmacos">
                <xsl:value-of select="."/>
                <br></br>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="doencas">
        <h2>Doencas:</h2>
        <xsl:for-each select="doenca">
            <xsl:value-of select="."/>
            <br></br>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>