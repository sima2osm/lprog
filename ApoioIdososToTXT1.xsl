<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.dei.isep.ipp.pt/apoioidosos">

    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="/ns:apoioIdosos">
        XML to TXT 2
        <xsl:apply-templates select="ns:infoIdosos"/>
    </xsl:template>
    
    <xsl:template match="ns:infoIdosos">
        Informacao dos idosos:
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="ns:idoso">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ns:idoso">
        <xsl:value-of select="concat('            ', @name)"/>
        
                Contactos:
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
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="ns:contactos">
                    Morada: <xsl:value-of select="ns:morada"/>
                    Telefone: <xsl:value-of select="ns:telefone"/>
    </xsl:template>
    
    <xsl:template match="ns:familia">
        
                Familiares:
        <xsl:apply-templates select="ns:familiar"/>
    </xsl:template>
    
    <xsl:template match="ns:familiar">
                    Numero: <xsl:value-of select="ns:numero"/>
                    Relacao: <xsl:value-of select="ns:relacao"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="ns:medicamentos">
        
                Medicamentos:
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="ns:medicamento"/>
    </xsl:template>
    
    <xsl:template match="ns:medicamento">
        <xsl:value-of select="concat('                    ', @name)"/>
                        Tempo de aviso: <xsl:value-of select="ns:tempoaviso"/> minutos
                        Hora de toma: <xsl:value-of select="ns:horatoma"/>
                        <xsl:text>&#xA;</xsl:text>
                        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="ns:alergias">
                Alergias:
        <xsl:if test="ns:comida">
                    Comida:
        <xsl:text>&#xA;</xsl:text>
            <xsl:for-each select="ns:comida">
                <xsl:value-of select="concat('                        ', .)"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ns:farmacos">
                    Farmacos:
        <xsl:text>&#xA;</xsl:text>
            <xsl:for-each select="ns:farmacos">
                <xsl:value-of select="concat('                        ', .)"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ns:doencas">
                Doencas:
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="ns:doenca">
            <xsl:value-of select="concat('                    ', .)"/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>