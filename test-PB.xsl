<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="root">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="a[@type='open']">
        <xsl:text disable-output-escaping="yes">&lt;a></xsl:text>
    </xsl:template>
    
    <xsl:template match="a[@type='close']">
        <xsl:text disable-output-escaping="yes">&lt;/a></xsl:text>
    </xsl:template>
    
</xsl:stylesheet>