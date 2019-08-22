<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:th="http://www.blackmesatech.com/2017/nss/trojan-horse"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="*[*]">
        <xsl:copy copy-namespaces="no">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="raising"
                select="child::node()[1]"/>
        </xsl:copy>    
    </xsl:template>
    <xsl:template match="*[@th:sID]" mode="raising">
        
        <!--* 1: handle this element *-->
        <xsl:copy>
            <xsl:copy-of select="@* except @th:sID"/>
            <xsl:apply-templates select="following-sibling::node()[1]"
                mode="raising">
            </xsl:apply-templates>
        </xsl:copy>
        
        <!--* 2: continue after this element *-->
        <xsl:apply-templates select="following-sibling::*
            [@th:eID = $sID 
            and namespace-uri()=$ns
            and local-name()=$ln]
            /following-sibling::node()[1]"
            mode="raising"/>
        
    </xsl:template>
</xsl:stylesheet>