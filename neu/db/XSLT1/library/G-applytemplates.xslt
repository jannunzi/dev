<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<!-- xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template-->
	
	<xsl:template match="developer">
		<h2><xsl:value-of select="name"></xsl:value-of>
		</h2>
		<ul>
			<xsl:apply-templates select="application"/>
		</ul>
	</xsl:template>
	
	<xsl:template match="application">
		<li>
			<xsl:apply-templates select="name"/>
		</li>
	</xsl:template>
	
	<xsl:template match="name">
		Name: <xsl:value-of select="."/>
	</xsl:template>
	
</xsl:stylesheet>